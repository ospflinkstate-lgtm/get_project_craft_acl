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

print("Processing traffic...")
service_centric = defaultdict(lambda: {'proto': set(), 'hosts': set()})

for h in hits:
    dst_ip = h.get('dst_addr')
    src_ip = h.get('src_addr')
    dst_port = h.get('dst_port')
    proto = str(h.get('proto', 'TCP')).lower()

    if not dst_ip or not dst_ip.startswith('10.27.101.'): continue
    if src_ip == dst_ip: continue
    if not is_standard_port(dst_port): continue

    service_centric[dst_port]['proto'].add(proto)
    service_centric[dst_port]['hosts'].add(dst_ip)

print("Generating MikroTik_Safe_PoC_Bridge.rsc...")
with open('MikroTik_Safe_PoC_Bridge.rsc', 'w', encoding='utf-8') as f:
    f.write("# =======================================================================\n")
    f.write("# MikroTik CCR2116 - SAFE PoC Transparent Firewall (Bridge Mode)\n")
    f.write("# Architecture: Inline between Core Switch and DC Access Switches\n")
    f.write("# Zero-Trust applied ONLY to specific 'poc-targets'. Others BYPASS.\n")
    f.write("# =======================================================================\n\n")

    f.write("# --- 1. BRIDGE CONFIGURATION ---\n")
    f.write("/interface bridge\n")
    f.write("add name=bridge-firewall-poc comment=\"Transparent L2 Firewall for PoC\"\n\n")
    
    f.write("/interface bridge port\n")
    f.write("add bridge=bridge-firewall-poc interface=ether1 comment=\"To MUIC Core Switch (Uplink)\"\n")
    f.write("add bridge=bridge-firewall-poc interface=ether2 comment=\"To DC Access Switches (Downlink)\"\n\n")

    f.write("# --- 2. ENABLE L2 TO L3 FIREWALL (CRITICAL) ---\n")
    f.write("/interface bridge settings\n")
    f.write("set use-ip-firewall=yes\n\n")
    
    f.write("# --- 3. MANAGEMENT IP (Optional) ---\n")
    f.write("/ip address\n")
    f.write("# add address=10.27.101.253/24 interface=bridge-firewall-poc comment=\"Management IP\"\n\n")

    f.write("# =======================================================================\n")
    f.write("/ip firewall address-list\n\n")
    
    f.write("# === SAFE PoC TARGETS (EDIT THIS LIST) ===\n")
    f.write("# ADD ONLY THE IPs YOU WANT TO TEST (e.g. Test-App 10.27.101.21)\n")
    f.write("add list=\"poc-targets\" address=10.27.101.21 comment=\"Test-App-01 (PoC Target)\"\n")
    f.write("add list=\"poc-targets\" address=10.27.101.22 comment=\"Test-App-02 (PoC Target)\"\n\n")

    sorted_ports = sorted(service_centric.keys())
    for port in sorted_ports:
        srv_name = get_service_name(port)
        f.write(f"# === Group: Servers providing {srv_name} (Port {port}) ===\n")
        hosts = sorted(list(service_centric[port]['hosts']), key=lambda x: int(x.split('.')[3]))
        for ip in hosts:
            hostname = get_hostname(ip)
            f.write(f"add list=\"allow-port-{port}-servers\" address={ip} comment=\"{hostname}\"\n")
        f.write("\n")

    f.write("# =======================================================================\n")
    f.write("/ip firewall filter\n\n")

    f.write("# [Rule 01] ACCEPT ESTABLISHED/RELATED (Stateful Return Traffic & Ephemeral)\n")
    f.write("add chain=forward \\\n    action=accept \\\n    connection-state=established,related \\\n    comment=\"[01] ACCEPT ESTABLISHED/RELATED\"\n\n")

    f.write("# [Rule 02] DROP INVALID PACKETS\n")
    f.write("add chain=forward \\\n    action=drop \\\n    connection-state=invalid \\\n    comment=\"[02] DROP INVALID\"\n\n")

    rule_idx = 3
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

    f.write("# [Rule 99] TARGETED ZERO-TRUST DROP (ONLY BLOCKS IPs IN 'poc-targets')\n")
    f.write("# Traffic to other servers in .101 will BYPASS this rule and work normally.\n")
    f.write("add chain=forward \\\n    action=drop \\\n    dst-address-list=\"poc-targets\" \\\n    comment=\"[99] SAFE PoC ZERO-TRUST DROP (Targeted)\"\n\n")

    f.write("# =======================================================================\n")
    f.write("# Configuration Generated Successfully!\n")

print("Done! Check MikroTik_Safe_PoC_Bridge.rsc")
