import json
from collections import defaultdict

STANDARD_PORTS = {
    3389, 8080, 8443, 3306, 5432, 27017, 6379, 9000, 1521, 1433,
    5060, 5061, 8000, 8001, 8002, 8081, 8888, 9200, 5900, 10050, 10051
}

def is_standard_port(port):
    if port is None: return False
    return port <= 1024 or port in STANDARD_PORTS

def get_service_name(port):
    m = {22:'SSH', 80:'HTTP', 443:'HTTPS', 3389:'RDP', 3306:'MySQL', 5432:'PostgreSQL', 53:'DNS', 161:'SNMP'}
    return m.get(port, f"Port_{port}")

print("Loading data...")
try:
    with open('notlike101_traffic_combined.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
        hits = data.get('hits', [])
except Exception as e:
    print(f"Error loading traffic data: {e}")
    hits = []

try:
    with open('host_map.json', 'r', encoding='utf-8') as f:
        host_map = json.load(f)
except:
    host_map = {}

def get_hostname(ip):
    return host_map.get(ip, {}).get('name', 'Unknown_Host').replace(' ', '_').replace('(', '').replace(')', '')

print("Processing traffic (Skipping PoC Hosts for NetFlow Auto-Gen)...")
service_centric = defaultdict(lambda: {'proto': set(), 'hosts': set()})

# The highly restricted PoC hosts that we do NOT want to auto-allow old ports for.
POC_HOSTS = {'10.27.101.41', '10.27.101.165'}

for h in hits:
    dst_ip = h.get('dst_addr')
    src_ip = h.get('src_addr')
    dst_port = h.get('dst_port')
    proto = str(h.get('proto', 'TCP')).lower()

    if not dst_ip or not dst_ip.startswith('10.27.101.'): continue
    if src_ip == dst_ip: continue
    if not is_standard_port(dst_port): continue

    # SKIP auto-generating rules for our targeted PoC hosts!
    if dst_ip in POC_HOSTS:
        continue

    service_centric[dst_port]['proto'].add(proto)
    service_centric[dst_port]['hosts'].add(dst_ip)

print("Generating MikroTik_Ultimate_PoC.rsc...")
with open('MikroTik_Ultimate_PoC.rsc', 'w', encoding='utf-8') as f:
    f.write("# =======================================================================\n")
    f.write("# MikroTik CCR2116 - THE ULTIMATE PoC CONFIGURATION (MERGED)\n")
    f.write("# Architecture: Transparent L2 Bridge\n")
    f.write("# Concept: Preloads ALL rules for the subnet, but enforces Zero-Trust DROP\n")
    f.write("#          ONLY on the PoC Targets (WAF .41 & Backend .165) for now.\n")
    f.write("# =======================================================================\n\n")

    f.write("# --- 1. BRIDGE CONFIGURATION ---\n")
    f.write("/interface bridge\n")
    f.write("add name=bridge-waf-poc comment=\"Transparent L2 Firewall for PoC\"\n\n")
    
    f.write("/interface bridge port\n")
    f.write("add bridge=bridge-waf-poc interface=ether1 comment=\"To MUIC Core Switch (Uplink)\"\n")
    f.write("add bridge=bridge-waf-poc interface=ether2 comment=\"To DC Access Switches (Downlink)\"\n\n")

    f.write("# --- 2. ENABLE L2 TO L3 FIREWALL ---\n")
    f.write("/interface bridge settings\n")
    f.write("set use-ip-firewall=yes\n\n")

    f.write("# =======================================================================\n")
    f.write("/ip firewall address-list\n\n")
    
    f.write("# === TARGETED HOSTS FOR POC ENFORCEMENT ===\n")
    f.write("add list=\"poc-targets\" address=10.27.101.41 comment=\"Safeline WAF\"\n")
    f.write("add list=\"poc-targets\" address=10.27.101.165 comment=\"Backend Apache\"\n\n")

    f.write("# === CUSTOM WAF FRONTEND ===\n")
    f.write("add list=\"waf-frontend\" address=10.27.101.41 comment=\"Safeline WAF\"\n\n")

    f.write("# === MANAGEMENT IP RANGE (EDIT THIS) ===\n")
    f.write("# Replace 10.0.0.0/8 with your actual Admin/NOC VLAN Subnet\n")
    f.write("add list=\"admin-management\" address=10.0.0.0/8 comment=\"IT Admin Network (Allow SSH)\"\n\n")

    f.write("# === AUTO-GENERATED LISTS FROM NETFLOW (Excluding PoC Hosts) ===\n")
    sorted_ports = sorted(service_centric.keys())
    for port in sorted_ports:
        srv_name = get_service_name(port)
        f.write(f"# Group: Servers providing {srv_name} (Port {port})\n")
        hosts = sorted(list(service_centric[port]['hosts']), key=lambda x: int(x.split('.')[3]))
        for ip in hosts:
            hostname = get_hostname(ip)
            f.write(f"add list=\"allow-port-{port}-servers\" address={ip} comment=\"{hostname}\"\n")
        f.write("\n")

    f.write("# =======================================================================\n")
    f.write("/ip firewall filter\n\n")

    f.write("# [Rule 01] ACCEPT ESTABLISHED/RELATED (Stateful Return Traffic)\n")
    f.write("add chain=forward \\\n    action=accept \\\n    connection-state=established,related \\\n    comment=\"[01] ACCEPT ESTABLISHED/RELATED\"\n\n")

    f.write("# [Rule 02] DROP INVALID PACKETS\n")
    f.write("add chain=forward \\\n    action=drop \\\n    connection-state=invalid \\\n    comment=\"[02] DROP INVALID\"\n\n")

    f.write("# --- CUSTOM STRICT RULES FOR PoC HOSTS ---\n")
    f.write("# [Rule 03] ALLOW HTTP/HTTPS TO WAF\n")
    f.write("add chain=forward \\\n    action=accept \\\n    protocol=tcp \\\n    dst-port=80,443 \\\n    dst-address-list=\"waf-frontend\" \\\n    comment=\"[03] ALLOW PUBLIC WEB TRAFFIC TO WAF\"\n\n")

    f.write("# [Rule 04] ALLOW SECURE SSH MANAGEMENT TO POC HOSTS\n")
    f.write("add chain=forward \\\n    action=accept \\\n    protocol=tcp \\\n    dst-port=22 \\\n    src-address-list=\"admin-management\" \\\n    dst-address-list=\"poc-targets\" \\\n    comment=\"[04] ALLOW SSH TO POC FROM ADMIN VLAN ONLY\"\n\n")

    f.write("# --- AUTO-GENERATED RULES FOR THE REST OF SUBNET .101 ---\n")
    rule_idx = 5
    for port in sorted_ports:
        srv_name = get_service_name(port)
        protos = list(service_centric[port]['proto'])
        for p in protos:
            f.write(f"# [Rule {rule_idx:02d}] ALLOW {srv_name.upper()} ({p.upper()}/{port})\n")
            f.write("add chain=forward \\\n")
            f.write("    action=accept \\\n")
            f.write(f"    protocol={p} \\\n")
            f.write(f"    dst-port={port} \\\n")
            f.write(f"    dst-address-list=\"allow-port-{port}-servers\" \\\n")
            f.write(f"    comment=\"[{rule_idx:02d}] ALLOW {srv_name.upper()} ({p.upper()})\"\n\n")
            rule_idx += 1

    f.write("# --- ZERO-TRUST DEFAULT DROP ---\n")
    f.write("# [Rule 99] TARGETED ZERO-TRUST DROP\n")
    f.write("# Drops any unallowed traffic aiming at the PoC Targets.\n")
    f.write("# (In the future, to protect the whole subnet, remove the dst-address-list condition)\n")
    f.write("add chain=forward \\\n    action=drop \\\n    dst-address-list=\"poc-targets\" \\\n    comment=\"[99] SAFE PoC ZERO-TRUST DROP (Currently enforced on WAF/Backend only)\"\n\n")

print("Done! Check MikroTik_Ultimate_PoC.rsc")
