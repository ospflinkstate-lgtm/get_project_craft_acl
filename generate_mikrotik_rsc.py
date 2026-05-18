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

print("Generating MikroTik_PoC_Whitelist.rsc...")
with open('MikroTik_PoC_Whitelist.rsc', 'w', encoding='utf-8') as f:
    f.write("# =======================================================================\n")
    f.write("# MikroTik RouterOS v7 - Whitelist PoC Auto-Generated Configuration\n")
    f.write("# Subnet Target: 10.27.101.0/24\n")
    f.write("# Zero-Trust Architecture: Default Drop with Port-Based Address-Lists\n")
    f.write("# =======================================================================\n\n")

    f.write("/ip firewall address-list\n\n")
    
    sorted_ports = sorted(service_centric.keys())
    
    # 1. Generate Address Lists
    for port in sorted_ports:
        srv_name = get_service_name(port)
        hosts = sorted(list(service_centric[port]['hosts']), key=lambda x: int(x.split('.')[3]))
        
        f.write(f"# === Group: Servers providing {srv_name} (Port {port}) ===\n")
        for ip in hosts:
            hostname = get_hostname(ip)
            f.write(f"add list=\"allow-port-{port}-servers\" address={ip} comment=\"{hostname}\"\n")
        f.write("\n")

    # 2. Generate Firewall Filter Rules
    f.write("# =======================================================================\n")
    f.write("/ip firewall filter\n\n")

    f.write("# [Rule 01] ACCEPT ESTABLISHED/RELATED (Stateful Return Traffic & Ephemeral)\n")
    f.write("add chain=forward \\\n")
    f.write("    action=accept \\\n")
    f.write("    connection-state=established,related \\\n")
    f.write("    comment=\"[01] ACCEPT ESTABLISHED/RELATED\"\n\n")

    f.write("# [Rule 02] DROP INVALID PACKETS\n")
    f.write("add chain=forward \\\n")
    f.write("    action=drop \\\n")
    f.write("    connection-state=invalid \\\n")
    f.write("    comment=\"[02] DROP INVALID\"\n\n")

    rule_idx = 3
    for port in sorted_ports:
        srv_name = get_service_name(port)
        protos = list(service_centric[port]['proto'])
        
        # If multiple protocols like tcp, udp are found, we'll write separate rules or use a generic one, 
        # but for simplicity MikroTik allows specifying one protocol per rule usually, unless we use custom matching.
        # We will create a rule per protocol
        for p in protos:
            f.write(f"# [Rule {rule_idx:02d}] ALLOW {srv_name.upper()} ({p.upper()}/{port})\n")
            f.write("add chain=forward \\\n")
            f.write("    action=accept \\\n")
            f.write(f"    protocol={p} \\\n")
            f.write(f"    dst-port={port} \\\n")
            f.write(f"    dst-address-list=\"allow-port-{port}-servers\" \\\n")
            f.write(f"    comment=\"[{rule_idx:02d}] ALLOW {srv_name.upper()} ({p.upper()})\"\n\n")
            rule_idx += 1

    f.write("# [Rule 99] DEFAULT DROP (Zero-Trust) for Target Subnet\n")
    f.write("add chain=forward \\\n")
    f.write("    action=drop \\\n")
    f.write("    dst-address=10.27.101.0/24 \\\n")
    f.write("    comment=\"[99] DEFAULT DROP ALL TO .101 (Zero-Trust)\"\n\n")
    
    f.write("# =======================================================================\n")
    f.write("# Configuration Generated Successfully!\n")

print("Done! Check MikroTik_PoC_Whitelist.rsc")
