def generate_waf_poc():
    filename = "MikroTik_WAF_Backend_PoC.rsc"
    print(f"Generating {filename}...")
    
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("# =======================================================================\n")
        f.write("# MikroTik CCR2116 - PoC Configuration for WAF (.41) & Backend (.165)\n")
        f.write("# Architecture: Transparent L2 Bridge\n")
        f.write("# Target Hosts: 10.27.101.41 (Safeline WAF), 10.27.101.165 (Apache Backend)\n")
        f.write("# =======================================================================\n\n")

        f.write("# --- 1. BRIDGE CONFIGURATION ---\n")
        f.write("/interface bridge\n")
        f.write("add name=bridge-waf-poc comment=\"Transparent L2 Firewall for WAF PoC\"\n\n")
        
        f.write("/interface bridge port\n")
        f.write("add bridge=bridge-waf-poc interface=ether1 comment=\"To MUIC Core Switch (Uplink)\"\n")
        f.write("add bridge=bridge-waf-poc interface=ether2 comment=\"To DC Access Switches (Downlink)\"\n\n")

        f.write("# --- 2. ENABLE L2 TO L3 FIREWALL ---\n")
        f.write("/interface bridge settings\n")
        f.write("set use-ip-firewall=yes\n\n")

        f.write("# =======================================================================\n")
        f.write("/ip firewall address-list\n\n")
        
        f.write("# === TARGETED HOSTS FOR POC ===\n")
        f.write("add list=\"poc-targets\" address=10.27.101.41 comment=\"Safeline WAF\"\n")
        f.write("add list=\"poc-targets\" address=10.27.101.165 comment=\"Backend Apache\"\n\n")

        f.write("# === WAF FRONTEND ===\n")
        f.write("add list=\"waf-frontend\" address=10.27.101.41 comment=\"Safeline WAF\"\n\n")

        f.write("# === MANAGEMENT IP RANGE (EDIT THIS) ===\n")
        f.write("# Replace 10.0.0.0/8 with your actual Admin/NOC VLAN Subnet\n")
        f.write("add list=\"admin-management\" address=10.0.0.0/8 comment=\"IT Admin Network (Allow SSH)\"\n\n")

        f.write("# =======================================================================\n")
        f.write("/ip firewall filter\n\n")

        f.write("# [Rule 01] ACCEPT ESTABLISHED/RELATED (Stateful Return Traffic)\n")
        f.write("add chain=forward \\\n    action=accept \\\n    connection-state=established,related \\\n    comment=\"[01] ACCEPT ESTABLISHED/RELATED\"\n\n")

        f.write("# [Rule 02] DROP INVALID PACKETS\n")
        f.write("add chain=forward \\\n    action=drop \\\n    connection-state=invalid \\\n    comment=\"[02] DROP INVALID\"\n\n")

        f.write("# [Rule 03] ALLOW HTTP/HTTPS TO WAF\n")
        f.write("add chain=forward \\\n    action=accept \\\n    protocol=tcp \\\n    dst-port=80,443 \\\n    dst-address-list=\"waf-frontend\" \\\n    comment=\"[03] ALLOW PUBLIC WEB TRAFFIC TO WAF\"\n\n")

        f.write("# [Rule 04] ALLOW SECURE SSH MANAGEMENT (Zero-Trust)\n")
        f.write("add chain=forward \\\n    action=accept \\\n    protocol=tcp \\\n    dst-port=22 \\\n    src-address-list=\"admin-management\" \\\n    dst-address-list=\"poc-targets\" \\\n    comment=\"[04] ALLOW SSH FROM ADMIN VLAN ONLY\"\n\n")

        f.write("# [Rule 99] TARGETED ZERO-TRUST DROP\n")
        f.write("# Drops any other traffic aiming at the WAF or Backend.\n")
        f.write("# Traffic to other IPs in .101 will safely BYPASS this rule.\n")
        f.write("add chain=forward \\\n    action=drop \\\n    dst-address-list=\"poc-targets\" \\\n    comment=\"[99] SAFE PoC ZERO-TRUST DROP FOR WAF/BACKEND\"\n\n")

        f.write("# =======================================================================\n")
        f.write("# Note on East-West Traffic (WAF -> Backend port 8881):\n")
        f.write("# If .41 and .165 are on the same Access Switch, they communicate locally at Layer 2.\n")
        f.write("# The traffic will NOT reach this MikroTik firewall. This is expected behavior.\n")
        f.write("# =======================================================================\n")

    print("Done!")

if __name__ == "__main__":
    generate_waf_poc()
