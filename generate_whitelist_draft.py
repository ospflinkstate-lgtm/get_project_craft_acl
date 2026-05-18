import json
import os
from collections import defaultdict

# 1. Define Standard Ports
STANDARD_ENTERPRISE_PORTS = {
    3389, # RDP
    8080, # HTTP Alt
    8443, # HTTPS Alt
    3306, # MySQL
    5432, # PostgreSQL
    27017, # MongoDB
    6379, # Redis
    9000, # MinIO / Web
    1521, # Oracle
    1433, # MSSQL
    5060, 5061, # SIP
    8000, 8001, 8002, 8081, 8888, # Web/API Alternatives
    9200, # Elasticsearch
    5900, # VNC
    10050, 10051 # Zabbix
}

def is_standard_port(port):
    if port is None: return False
    return port <= 1024 or port in STANDARD_ENTERPRISE_PORTS

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

print("Processing traffic...")
# Data structures
host_centric = defaultdict(lambda: defaultdict(lambda: {'proto': set(), 'sources': set(), 'flows': 0, 'gb': 0.0}))
service_centric = defaultdict(lambda: {'proto': set(), 'hosts': set()})

for h in hits:
    dst_ip = h.get('dst_addr')
    src_ip = h.get('src_addr')
    dst_port = h.get('dst_port')
    proto = str(h.get('proto', 'TCP')).upper()
    flows = h.get('total_flows', 1)
    gb = h.get('total_gb', 0.0)

    # Filtering logic
    if not dst_ip or not dst_ip.startswith('10.27.101.'): continue
    if src_ip == dst_ip: continue # Ignore loopback
    if not is_standard_port(dst_port): continue # Filter Ephemeral/CDN Return Traffic

    # Host-centric
    host_centric[dst_ip][dst_port]['proto'].add(proto)
    host_centric[dst_ip][dst_port]['sources'].add(src_ip)
    host_centric[dst_ip][dst_port]['flows'] += flows
    host_centric[dst_ip][dst_port]['gb'] += gb

    # Service-centric
    service_centric[dst_port]['proto'].add(proto)
    service_centric[dst_port]['hosts'].add(dst_ip)

print("Generating Draft_Whitelist_By_Host.md...")
with open('Draft_Whitelist_By_Host.md', 'w', encoding='utf-8') as f:
    f.write("# 🛡️ Draft Whitelist ACL (By Host)\n")
    f.write("> **มุมมองที่ 1:** ตรวจสอบว่าแต่ละ Host (Server) มีพอร์ตอะไรเข้ามาบ้าง และเราควรอนุญาตพอร์ตเหล่านี้ตามหน้าที่ของมันหรือไม่\n\n")
    
    # Sort by IP
    sorted_hosts = sorted(host_centric.keys(), key=lambda ip: int(ip.split('.')[3]))
    
    for ip in sorted_hosts:
        hostname = host_map.get(ip, {}).get('name', 'Unknown Host')
        f.write(f"## 🖥️ {ip} ({hostname})\n")
        f.write("| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |\n")
        f.write("|------------------|----------|---------------|-------|----------|--------|\n")
        
        sorted_ports = sorted(host_centric[ip].keys())
        for port in sorted_ports:
            stats = host_centric[ip][port]
            protos = "/".join(sorted(stats['proto']))
            sources_count = len(stats['sources'])
            f.write(f"| Port {port} | {protos} | {sources_count} IPs | {stats['flows']:,} | [ ] Allow / [ ] Deny | |\n")
        f.write("\n---\n\n")

print("Generating Draft_Whitelist_By_Service.md...")
with open('Draft_Whitelist_By_Service.md', 'w', encoding='utf-8') as f:
    f.write("# 🔌 Draft Whitelist ACL (By Service / Port)\n")
    f.write("> **มุมมองที่ 2:** ตรวจสอบแบบกลุ่มบริการ เช่น พอร์ต 22 (SSH) ควรมี Server เครื่องไหนบ้างที่ถูกเปิดให้เข้าถึงได้ (เพื่อป้องกันการเปิดพอร์ตจัดการระบบพร่ำเพรื่อ)\n\n")
    
    sorted_services = sorted(service_centric.keys())
    for port in sorted_services:
        stats = service_centric[port]
        protos = "/".join(sorted(stats['proto']))
        hosts_count = len(stats['hosts'])
        
        f.write(f"## 🌐 Port {port} ({protos})\n")
        f.write(f"**Total Internal Hosts providing this service:** {hosts_count}\n\n")
        f.write("| Internal Target IP | Hostname | Decision | Remark |\n")
        f.write("|--------------------|----------|----------|--------|\n")
        
        sorted_target_hosts = sorted(list(stats['hosts']), key=lambda ip: int(ip.split('.')[3]))
        for ip in sorted_target_hosts:
            hostname = host_map.get(ip, {}).get('name', 'Unknown Host')
            f.write(f"| {ip} | {hostname} | [ ] Valid / [ ] Invalid | |\n")
        f.write("\n---\n\n")

print("Done! Check Draft_Whitelist_By_Host.md and Draft_Whitelist_By_Service.md")
