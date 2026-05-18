# =======================================================================
# MikroTik RouterOS v7 - Whitelist PoC Auto-Generated Configuration
# Subnet Target: 10.27.101.0/24
# Zero-Trust Architecture: Default Drop with Port-Based Address-Lists
# =======================================================================

/ip firewall address-list

# === Group: Servers providing SSH (Port 22) ===
add list="allow-port-22-servers" address=10.27.101.1 comment="cc-main"
add list="allow-port-22-servers" address=10.27.101.9 comment="web-portal"
add list="allow-port-22-servers" address=10.27.101.21 comment="TestLabs-21-101-200"
add list="allow-port-22-servers" address=10.27.101.22 comment="Test-App-02_os.muic.io"
add list="allow-port-22-servers" address=10.27.101.23 comment="Test-App-03_teedy"
add list="allow-port-22-servers" address=10.27.101.25 comment="Net-NPS-200_unifi-controller"
add list="allow-port-22-servers" address=10.27.101.27 comment="IC-Payment-v2"
add list="allow-port-22-servers" address=10.27.101.34 comment="keycloak-200-1"
add list="allow-port-22-servers" address=10.27.101.35 comment="minio"
add list="allow-port-22-servers" address=10.27.101.38 comment="ED-WP_ed-wp"
add list="allow-port-22-servers" address=10.27.101.46 comment="Airflow"
add list="allow-port-22-servers" address=10.27.101.52 comment="ic-db-200"
add list="allow-port-22-servers" address=10.27.101.71 comment="kong-api"
add list="allow-port-22-servers" address=10.27.101.77 comment="ubu-poc_Legacy-App-03"
add list="allow-port-22-servers" address=10.27.101.83 comment="Sci-Div-01v2_cs.muic.mahidol.ac.th"
add list="allow-port-22-servers" address=10.27.101.87 comment="Kong-Legacy-199_Routing"
add list="allow-port-22-servers" address=10.27.101.91 comment="it-helpdesk"
add list="allow-port-22-servers" address=10.27.101.98 comment="muproxy-243"
add list="allow-port-22-servers" address=10.27.101.114 comment="swarm-234"
add list="allow-port-22-servers" address=10.27.101.115 comment="swarm-243"
add list="allow-port-22-servers" address=10.27.101.116 comment="swarm-200"
add list="allow-port-22-servers" address=10.27.101.117 comment="swarm-199"
add list="allow-port-22-servers" address=10.27.101.153 comment="keycloak-199"
add list="allow-port-22-servers" address=10.27.101.154 comment="Wifi-DNSMASQ"
add list="allow-port-22-servers" address=10.27.101.203 comment="k3s-Control"
add list="allow-port-22-servers" address=10.27.101.210 comment="sky-Grad-Portal"
add list="allow-port-22-servers" address=10.27.101.211 comment="Wazuh-munet"
add list="allow-port-22-servers" address=10.27.101.232 comment="KeystoneApp-Prod-01_kapp01"
add list="allow-port-22-servers" address=10.27.101.236 comment="ks-nfs"

# === Group: Servers providing Port_25 (Port 25) ===
add list="allow-port-25-servers" address=10.27.101.247 comment="mail-relay"

# === Group: Servers providing DNS (Port 53) ===
add list="allow-port-53-servers" address=10.27.101.154 comment="Wifi-DNSMASQ"

# === Group: Servers providing HTTP (Port 80) ===
add list="allow-port-80-servers" address=10.27.101.1 comment="cc-main"
add list="allow-port-80-servers" address=10.27.101.2 comment=""
add list="allow-port-80-servers" address=10.27.101.3 comment="waf-oasis"
add list="allow-port-80-servers" address=10.27.101.4 comment="netflow_testing_till_31MAY2026"
add list="allow-port-80-servers" address=10.27.101.5 comment="netflow_testing__till_31MAY2026"
add list="allow-port-80-servers" address=10.27.101.6 comment=""
add list="allow-port-80-servers" address=10.27.101.9 comment="web-portal"
add list="allow-port-80-servers" address=10.27.101.13 comment="WAF_-_pconline"
add list="allow-port-80-servers" address=10.27.101.25 comment="Net-NPS-200_unifi-controller"
add list="allow-port-80-servers" address=10.27.101.27 comment="IC-Payment-v2"
add list="allow-port-80-servers" address=10.27.101.38 comment="ED-WP_ed-wp"
add list="allow-port-80-servers" address=10.27.101.41 comment="waf-wiki"
add list="allow-port-80-servers" address=10.27.101.47 comment="EDX-App-251"
add list="allow-port-80-servers" address=10.27.101.53 comment="waf-poc"
add list="allow-port-80-servers" address=10.27.101.66 comment="waf-lib"
add list="allow-port-80-servers" address=10.27.101.77 comment="ubu-poc_Legacy-App-03"
add list="allow-port-80-servers" address=10.27.101.83 comment="Sci-Div-01v2_cs.muic.mahidol.ac.th"
add list="allow-port-80-servers" address=10.27.101.87 comment="Kong-Legacy-199_Routing"
add list="allow-port-80-servers" address=10.27.101.89 comment="HR_Plus"
add list="allow-port-80-servers" address=10.27.101.90 comment="QNAP-17"
add list="allow-port-80-servers" address=10.27.101.91 comment="it-helpdesk"
add list="allow-port-80-servers" address=10.27.101.98 comment="muproxy-243"
add list="allow-port-80-servers" address=10.27.101.154 comment="Wifi-DNSMASQ"
add list="allow-port-80-servers" address=10.27.101.167 comment="Zabbix"
add list="allow-port-80-servers" address=10.27.101.209 comment="GLPI"
add list="allow-port-80-servers" address=10.27.101.210 comment="sky-Grad-Portal"
add list="allow-port-80-servers" address=10.27.101.225 comment=""

# === Group: Servers providing Port_88 (Port 88) ===
add list="allow-port-88-servers" address=10.27.101.102 comment="muic.ad.muic.io"

# === Group: Servers providing Port_111 (Port 111) ===
add list="allow-port-111-servers" address=10.27.101.10 comment="QNAP-20"
add list="allow-port-111-servers" address=10.27.101.58 comment="QNAP-07"
add list="allow-port-111-servers" address=10.27.101.64 comment="QNAP-10"
add list="allow-port-111-servers" address=10.27.101.90 comment="QNAP-17"

# === Group: Servers providing Port_135 (Port 135) ===
add list="allow-port-135-servers" address=10.27.101.102 comment="muic.ad.muic.io"

# === Group: Servers providing Port_139 (Port 139) ===
add list="allow-port-139-servers" address=10.27.101.55 comment="QNAP-01"
add list="allow-port-139-servers" address=10.27.101.88 comment="QNAP-16"
add list="allow-port-139-servers" address=10.27.101.90 comment="QNAP-17"

# === Group: Servers providing Port_389 (Port 389) ===
add list="allow-port-389-servers" address=10.27.101.102 comment="muic.ad.muic.io"

# === Group: Servers providing HTTPS (Port 443) ===
add list="allow-port-443-servers" address=10.27.101.1 comment="cc-main"
add list="allow-port-443-servers" address=10.27.101.2 comment=""
add list="allow-port-443-servers" address=10.27.101.3 comment="waf-oasis"
add list="allow-port-443-servers" address=10.27.101.4 comment="netflow_testing_till_31MAY2026"
add list="allow-port-443-servers" address=10.27.101.5 comment="netflow_testing__till_31MAY2026"
add list="allow-port-443-servers" address=10.27.101.6 comment=""
add list="allow-port-443-servers" address=10.27.101.9 comment="web-portal"
add list="allow-port-443-servers" address=10.27.101.10 comment="QNAP-20"
add list="allow-port-443-servers" address=10.27.101.13 comment="WAF_-_pconline"
add list="allow-port-443-servers" address=10.27.101.20 comment="Multi-01_APACHE_GUACAMOLE"
add list="allow-port-443-servers" address=10.27.101.27 comment="IC-Payment-v2"
add list="allow-port-443-servers" address=10.27.101.38 comment="ED-WP_ed-wp"
add list="allow-port-443-servers" address=10.27.101.41 comment="waf-wiki"
add list="allow-port-443-servers" address=10.27.101.47 comment="EDX-App-251"
add list="allow-port-443-servers" address=10.27.101.53 comment="waf-poc"
add list="allow-port-443-servers" address=10.27.101.57 comment="QNAP-06"
add list="allow-port-443-servers" address=10.27.101.58 comment="QNAP-07"
add list="allow-port-443-servers" address=10.27.101.60 comment="QNAP-09-Lib"
add list="allow-port-443-servers" address=10.27.101.64 comment="QNAP-10"
add list="allow-port-443-servers" address=10.27.101.66 comment="waf-lib"
add list="allow-port-443-servers" address=10.27.101.70 comment="QNAP-14"
add list="allow-port-443-servers" address=10.27.101.80 comment="QNAP-15"
add list="allow-port-443-servers" address=10.27.101.83 comment="Sci-Div-01v2_cs.muic.mahidol.ac.th"
add list="allow-port-443-servers" address=10.27.101.87 comment="Kong-Legacy-199_Routing"
add list="allow-port-443-servers" address=10.27.101.88 comment="QNAP-16"
add list="allow-port-443-servers" address=10.27.101.90 comment="QNAP-17"
add list="allow-port-443-servers" address=10.27.101.98 comment="muproxy-243"
add list="allow-port-443-servers" address=10.27.101.126 comment="HP_Proliant_DL380G7"
add list="allow-port-443-servers" address=10.27.101.134 comment="HP_Proliant_DL560_Gen_8_SKY"
add list="allow-port-443-servers" address=10.27.101.167 comment="Zabbix"
add list="allow-port-443-servers" address=10.27.101.199 comment="DELL_PowerEdge_R750"
add list="allow-port-443-servers" address=10.27.101.200 comment="DELL_PowerEdge_R750"
add list="allow-port-443-servers" address=10.27.101.211 comment="Wazuh-munet"
add list="allow-port-443-servers" address=10.27.101.230 comment="DELL_PowerEdge_630"
add list="allow-port-443-servers" address=10.27.101.234 comment="DELL_PowerEdge_640_SKY+"
add list="allow-port-443-servers" address=10.27.101.240 comment="DELL_PowerEdge_630"
add list="allow-port-443-servers" address=10.27.101.243 comment="DELL_PowerEdge_640_SKY+"
add list="allow-port-443-servers" address=10.27.101.251 comment="DELL_PowerEdge_R610"

# === Group: Servers providing Port_445 (Port 445) ===
add list="allow-port-445-servers" address=10.27.101.1 comment="cc-main"
add list="allow-port-445-servers" address=10.27.101.2 comment=""
add list="allow-port-445-servers" address=10.27.101.3 comment="waf-oasis"
add list="allow-port-445-servers" address=10.27.101.4 comment="netflow_testing_till_31MAY2026"
add list="allow-port-445-servers" address=10.27.101.5 comment="netflow_testing__till_31MAY2026"
add list="allow-port-445-servers" address=10.27.101.6 comment=""
add list="allow-port-445-servers" address=10.27.101.7 comment="netflow_testing__till_31MAY2026"
add list="allow-port-445-servers" address=10.27.101.8 comment="netflow_testing__till_31MAY2026"
add list="allow-port-445-servers" address=10.27.101.9 comment="web-portal"
add list="allow-port-445-servers" address=10.27.101.10 comment="QNAP-20"
add list="allow-port-445-servers" address=10.27.101.11 comment="teedy-app"
add list="allow-port-445-servers" address=10.27.101.13 comment="WAF_-_pconline"
add list="allow-port-445-servers" address=10.27.101.18 comment="Web-Lib_WP_libwp"
add list="allow-port-445-servers" address=10.27.101.20 comment="Multi-01_APACHE_GUACAMOLE"
add list="allow-port-445-servers" address=10.27.101.21 comment="TestLabs-21-101-200"
add list="allow-port-445-servers" address=10.27.101.22 comment="Test-App-02_os.muic.io"
add list="allow-port-445-servers" address=10.27.101.23 comment="Test-App-03_teedy"
add list="allow-port-445-servers" address=10.27.101.24 comment="packetfence"
add list="allow-port-445-servers" address=10.27.101.25 comment="Net-NPS-200_unifi-controller"
add list="allow-port-445-servers" address=10.27.101.26 comment="netbox"
add list="allow-port-445-servers" address=10.27.101.27 comment="IC-Payment-v2"
add list="allow-port-445-servers" address=10.27.101.28 comment=""
add list="allow-port-445-servers" address=10.27.101.29 comment=""
add list="allow-port-445-servers" address=10.27.101.32 comment="Graylog"
add list="allow-port-445-servers" address=10.27.101.34 comment="keycloak-200-1"
add list="allow-port-445-servers" address=10.27.101.35 comment="minio"
add list="allow-port-445-servers" address=10.27.101.38 comment="ED-WP_ed-wp"
add list="allow-port-445-servers" address=10.27.101.40 comment="DB-IC-199_db-0"
add list="allow-port-445-servers" address=10.27.101.41 comment="waf-wiki"
add list="allow-port-445-servers" address=10.27.101.45 comment=""
add list="allow-port-445-servers" address=10.27.101.46 comment="Airflow"
add list="allow-port-445-servers" address=10.27.101.47 comment="EDX-App-251"
add list="allow-port-445-servers" address=10.27.101.50 comment=""
add list="allow-port-445-servers" address=10.27.101.52 comment="ic-db-200"
add list="allow-port-445-servers" address=10.27.101.53 comment="waf-poc"
add list="allow-port-445-servers" address=10.27.101.54 comment="VEEAM-11-03"
add list="allow-port-445-servers" address=10.27.101.55 comment="QNAP-01"
add list="allow-port-445-servers" address=10.27.101.57 comment="QNAP-06"
add list="allow-port-445-servers" address=10.27.101.58 comment="QNAP-07"
add list="allow-port-445-servers" address=10.27.101.60 comment="QNAP-09-Lib"
add list="allow-port-445-servers" address=10.27.101.61 comment="legacy-nfs"
add list="allow-port-445-servers" address=10.27.101.63 comment="VEEAM-11-04"
add list="allow-port-445-servers" address=10.27.101.64 comment="QNAP-10"
add list="allow-port-445-servers" address=10.27.101.66 comment="waf-lib"
add list="allow-port-445-servers" address=10.27.101.68 comment="QNAP-13"
add list="allow-port-445-servers" address=10.27.101.70 comment="QNAP-14"
add list="allow-port-445-servers" address=10.27.101.71 comment="kong-api"
add list="allow-port-445-servers" address=10.27.101.76 comment="VEEAM-Backup-11"
add list="allow-port-445-servers" address=10.27.101.77 comment="ubu-poc_Legacy-App-03"
add list="allow-port-445-servers" address=10.27.101.80 comment="QNAP-15"
add list="allow-port-445-servers" address=10.27.101.83 comment="Sci-Div-01v2_cs.muic.mahidol.ac.th"
add list="allow-port-445-servers" address=10.27.101.85 comment="VEEAM-11-02"
add list="allow-port-445-servers" address=10.27.101.87 comment="Kong-Legacy-199_Routing"
add list="allow-port-445-servers" address=10.27.101.88 comment="QNAP-16"
add list="allow-port-445-servers" address=10.27.101.89 comment="HR_Plus"
add list="allow-port-445-servers" address=10.27.101.90 comment="QNAP-17"
add list="allow-port-445-servers" address=10.27.101.91 comment="it-helpdesk"
add list="allow-port-445-servers" address=10.27.101.93 comment="dspace"
add list="allow-port-445-servers" address=10.27.101.98 comment="muproxy-243"
add list="allow-port-445-servers" address=10.27.101.102 comment="muic.ad.muic.io"
add list="allow-port-445-servers" address=10.27.101.106 comment=""
add list="allow-port-445-servers" address=10.27.101.108 comment=""
add list="allow-port-445-servers" address=10.27.101.113 comment="apisix-demo"
add list="allow-port-445-servers" address=10.27.101.114 comment="swarm-234"
add list="allow-port-445-servers" address=10.27.101.115 comment="swarm-243"
add list="allow-port-445-servers" address=10.27.101.116 comment="swarm-200"
add list="allow-port-445-servers" address=10.27.101.117 comment="swarm-199"
add list="allow-port-445-servers" address=10.27.101.118 comment="ic-elearning"
add list="allow-port-445-servers" address=10.27.101.126 comment="HP_Proliant_DL380G7"
add list="allow-port-445-servers" address=10.27.101.132 comment="k8s_control"
add list="allow-port-445-servers" address=10.27.101.133 comment="Cloud-sync.muic.io"
add list="allow-port-445-servers" address=10.27.101.134 comment="HP_Proliant_DL560_Gen_8_SKY"
add list="allow-port-445-servers" address=10.27.101.135 comment=""
add list="allow-port-445-servers" address=10.27.101.141 comment="k3s-node-01"
add list="allow-port-445-servers" address=10.27.101.142 comment="k3s-node-02_node-02"
add list="allow-port-445-servers" address=10.27.101.143 comment="k3s-node-03"
add list="allow-port-445-servers" address=10.27.101.144 comment=""
add list="allow-port-445-servers" address=10.27.101.149 comment="DELL_PowerEdge_R610"
add list="allow-port-445-servers" address=10.27.101.150 comment="WinDBTStart-01-134"
add list="allow-port-445-servers" address=10.27.101.153 comment="keycloak-199"
add list="allow-port-445-servers" address=10.27.101.154 comment="Wifi-DNSMASQ"
add list="allow-port-445-servers" address=10.27.101.165 comment=""
add list="allow-port-445-servers" address=10.27.101.166 comment="Web-Dspace-126_Rev03"
add list="allow-port-445-servers" address=10.27.101.167 comment="Zabbix"
add list="allow-port-445-servers" address=10.27.101.194 comment="Ubuntu-Prometheus"
add list="allow-port-445-servers" address=10.27.101.197 comment="Ubuntu-For_Testing"
add list="allow-port-445-servers" address=10.27.101.199 comment="DELL_PowerEdge_R750"
add list="allow-port-445-servers" address=10.27.101.200 comment="DELL_PowerEdge_R750"
add list="allow-port-445-servers" address=10.27.101.201 comment="DELL_PowerEdge_R610"
add list="allow-port-445-servers" address=10.27.101.203 comment="k3s-Control"
add list="allow-port-445-servers" address=10.27.101.205 comment="DELL_PowerEdge_R610"
add list="allow-port-445-servers" address=10.27.101.206 comment="ic-data"
add list="allow-port-445-servers" address=10.27.101.207 comment=""
add list="allow-port-445-servers" address=10.27.101.209 comment="GLPI"
add list="allow-port-445-servers" address=10.27.101.211 comment="Wazuh-munet"
add list="allow-port-445-servers" address=10.27.101.213 comment=""
add list="allow-port-445-servers" address=10.27.101.216 comment="swarm-NFS-199_web-enroll"
add list="allow-port-445-servers" address=10.27.101.221 comment=""
add list="allow-port-445-servers" address=10.27.101.222 comment=""
add list="allow-port-445-servers" address=10.27.101.224 comment=""
add list="allow-port-445-servers" address=10.27.101.225 comment=""
add list="allow-port-445-servers" address=10.27.101.229 comment=""
add list="allow-port-445-servers" address=10.27.101.230 comment="DELL_PowerEdge_630"
add list="allow-port-445-servers" address=10.27.101.232 comment="KeystoneApp-Prod-01_kapp01"
add list="allow-port-445-servers" address=10.27.101.234 comment="DELL_PowerEdge_640_SKY+"
add list="allow-port-445-servers" address=10.27.101.235 comment="KeystoneApp-UAT"
add list="allow-port-445-servers" address=10.27.101.236 comment="ks-nfs"
add list="allow-port-445-servers" address=10.27.101.240 comment="DELL_PowerEdge_630"
add list="allow-port-445-servers" address=10.27.101.243 comment="DELL_PowerEdge_640_SKY+"
add list="allow-port-445-servers" address=10.27.101.244 comment="Keystone-DB-01"
add list="allow-port-445-servers" address=10.27.101.245 comment="Keystone-DB-02"
add list="allow-port-445-servers" address=10.27.101.247 comment="mail-relay"
add list="allow-port-445-servers" address=10.27.101.248 comment="mail-relay-ED-200"
add list="allow-port-445-servers" address=10.27.101.251 comment="DELL_PowerEdge_R610"

# === Group: Servers providing Port_853 (Port 853) ===
add list="allow-port-853-servers" address=10.27.101.154 comment="Wifi-DNSMASQ"

# === Group: Servers providing Port_1024 (Port 1024) ===
add list="allow-port-1024-servers" address=10.27.101.108 comment=""

# === Group: Servers providing Port_1433 (Port 1433) ===
add list="allow-port-1433-servers" address=10.27.101.206 comment="ic-data"
add list="allow-port-1433-servers" address=10.27.101.245 comment="Keystone-DB-02"

# === Group: Servers providing Port_1521 (Port 1521) ===
add list="allow-port-1521-servers" address=10.27.101.5 comment="netflow_testing__till_31MAY2026"

# === Group: Servers providing RDP (Port 3389) ===
add list="allow-port-3389-servers" address=10.27.101.54 comment="VEEAM-11-03"
add list="allow-port-3389-servers" address=10.27.101.63 comment="VEEAM-11-04"
add list="allow-port-3389-servers" address=10.27.101.76 comment="VEEAM-Backup-11"
add list="allow-port-3389-servers" address=10.27.101.85 comment="VEEAM-11-02"
add list="allow-port-3389-servers" address=10.27.101.102 comment="muic.ad.muic.io"
add list="allow-port-3389-servers" address=10.27.101.133 comment="Cloud-sync.muic.io"
add list="allow-port-3389-servers" address=10.27.101.213 comment=""
add list="allow-port-3389-servers" address=10.27.101.244 comment="Keystone-DB-01"
add list="allow-port-3389-servers" address=10.27.101.245 comment="Keystone-DB-02"

# === Group: Servers providing Port_8000 (Port 8000) ===
add list="allow-port-8000-servers" address=10.27.101.26 comment="netbox"
add list="allow-port-8000-servers" address=10.27.101.108 comment=""

# === Group: Servers providing Port_8002 (Port 8002) ===
add list="allow-port-8002-servers" address=10.27.101.108 comment=""

# === Group: Servers providing Port_8080 (Port 8080) ===
add list="allow-port-8080-servers" address=10.27.101.25 comment="Net-NPS-200_unifi-controller"
add list="allow-port-8080-servers" address=10.27.101.77 comment="ubu-poc_Legacy-App-03"
add list="allow-port-8080-servers" address=10.27.101.88 comment="QNAP-16"
add list="allow-port-8080-servers" address=10.27.101.108 comment=""
add list="allow-port-8080-servers" address=10.27.101.166 comment="Web-Dspace-126_Rev03"

# === Group: Servers providing Port_8081 (Port 8081) ===
add list="allow-port-8081-servers" address=10.27.101.18 comment="Web-Lib_WP_libwp"
add list="allow-port-8081-servers" address=10.27.101.46 comment="Airflow"

# === Group: Servers providing Port_8443 (Port 8443) ===
add list="allow-port-8443-servers" address=10.27.101.25 comment="Net-NPS-200_unifi-controller"

# === Group: Servers providing Port_8888 (Port 8888) ===
add list="allow-port-8888-servers" address=10.27.101.108 comment=""

# === Group: Servers providing Port_9000 (Port 9000) ===
add list="allow-port-9000-servers" address=10.27.101.32 comment="Graylog"
add list="allow-port-9000-servers" address=10.27.101.108 comment=""

# === Group: Servers providing Port_9200 (Port 9200) ===
add list="allow-port-9200-servers" address=10.27.101.108 comment=""

# === Group: Servers providing Port_10051 (Port 10051) ===
add list="allow-port-10051-servers" address=10.27.101.108 comment=""
add list="allow-port-10051-servers" address=10.27.101.167 comment="Zabbix"

# =======================================================================
/ip firewall filter

# [Rule 01] ACCEPT ESTABLISHED/RELATED (Stateful Return Traffic & Ephemeral)
add chain=forward \
    action=accept \
    connection-state=established,related \
    comment="[01] ACCEPT ESTABLISHED/RELATED"

# [Rule 02] DROP INVALID PACKETS
add chain=forward \
    action=drop \
    connection-state=invalid \
    comment="[02] DROP INVALID"

# [Rule 03] ALLOW SSH (TCP/22)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=22 \
    dst-address-list="allow-port-22-servers" \
    comment="[03] ALLOW SSH (TCP)"

# [Rule 04] ALLOW PORT_25 (TCP/25)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=25 \
    dst-address-list="allow-port-25-servers" \
    comment="[04] ALLOW PORT_25 (TCP)"

# [Rule 05] ALLOW DNS (TCP/53)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=53 \
    dst-address-list="allow-port-53-servers" \
    comment="[05] ALLOW DNS (TCP)"

# [Rule 06] ALLOW HTTP (TCP/80)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=80 \
    dst-address-list="allow-port-80-servers" \
    comment="[06] ALLOW HTTP (TCP)"

# [Rule 07] ALLOW PORT_88 (TCP/88)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=88 \
    dst-address-list="allow-port-88-servers" \
    comment="[07] ALLOW PORT_88 (TCP)"

# [Rule 08] ALLOW PORT_111 (TCP/111)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=111 \
    dst-address-list="allow-port-111-servers" \
    comment="[08] ALLOW PORT_111 (TCP)"

# [Rule 09] ALLOW PORT_135 (TCP/135)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=135 \
    dst-address-list="allow-port-135-servers" \
    comment="[09] ALLOW PORT_135 (TCP)"

# [Rule 10] ALLOW PORT_139 (TCP/139)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=139 \
    dst-address-list="allow-port-139-servers" \
    comment="[10] ALLOW PORT_139 (TCP)"

# [Rule 11] ALLOW PORT_389 (TCP/389)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=389 \
    dst-address-list="allow-port-389-servers" \
    comment="[11] ALLOW PORT_389 (TCP)"

# [Rule 12] ALLOW HTTPS (TCP/443)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=443 \
    dst-address-list="allow-port-443-servers" \
    comment="[12] ALLOW HTTPS (TCP)"

# [Rule 13] ALLOW PORT_445 (TCP/445)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=445 \
    dst-address-list="allow-port-445-servers" \
    comment="[13] ALLOW PORT_445 (TCP)"

# [Rule 14] ALLOW PORT_853 (TCP/853)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=853 \
    dst-address-list="allow-port-853-servers" \
    comment="[14] ALLOW PORT_853 (TCP)"

# [Rule 15] ALLOW PORT_1024 (TCP/1024)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=1024 \
    dst-address-list="allow-port-1024-servers" \
    comment="[15] ALLOW PORT_1024 (TCP)"

# [Rule 16] ALLOW PORT_1433 (TCP/1433)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=1433 \
    dst-address-list="allow-port-1433-servers" \
    comment="[16] ALLOW PORT_1433 (TCP)"

# [Rule 17] ALLOW PORT_1521 (TCP/1521)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=1521 \
    dst-address-list="allow-port-1521-servers" \
    comment="[17] ALLOW PORT_1521 (TCP)"

# [Rule 18] ALLOW RDP (TCP/3389)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=3389 \
    dst-address-list="allow-port-3389-servers" \
    comment="[18] ALLOW RDP (TCP)"

# [Rule 19] ALLOW PORT_8000 (TCP/8000)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=8000 \
    dst-address-list="allow-port-8000-servers" \
    comment="[19] ALLOW PORT_8000 (TCP)"

# [Rule 20] ALLOW PORT_8002 (TCP/8002)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=8002 \
    dst-address-list="allow-port-8002-servers" \
    comment="[20] ALLOW PORT_8002 (TCP)"

# [Rule 21] ALLOW PORT_8080 (TCP/8080)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=8080 \
    dst-address-list="allow-port-8080-servers" \
    comment="[21] ALLOW PORT_8080 (TCP)"

# [Rule 22] ALLOW PORT_8081 (TCP/8081)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=8081 \
    dst-address-list="allow-port-8081-servers" \
    comment="[22] ALLOW PORT_8081 (TCP)"

# [Rule 23] ALLOW PORT_8443 (TCP/8443)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=8443 \
    dst-address-list="allow-port-8443-servers" \
    comment="[23] ALLOW PORT_8443 (TCP)"

# [Rule 24] ALLOW PORT_8888 (TCP/8888)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=8888 \
    dst-address-list="allow-port-8888-servers" \
    comment="[24] ALLOW PORT_8888 (TCP)"

# [Rule 25] ALLOW PORT_9000 (TCP/9000)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=9000 \
    dst-address-list="allow-port-9000-servers" \
    comment="[25] ALLOW PORT_9000 (TCP)"

# [Rule 26] ALLOW PORT_9200 (TCP/9200)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=9200 \
    dst-address-list="allow-port-9200-servers" \
    comment="[26] ALLOW PORT_9200 (TCP)"

# [Rule 27] ALLOW PORT_10051 (TCP/10051)
add chain=forward \
    action=accept \
    protocol=tcp \
    dst-port=10051 \
    dst-address-list="allow-port-10051-servers" \
    comment="[27] ALLOW PORT_10051 (TCP)"

# [Rule 99] DEFAULT DROP (Zero-Trust) for Target Subnet
add chain=forward \
    action=drop \
    dst-address=10.27.101.0/24 \
    comment="[99] DEFAULT DROP ALL TO .101 (Zero-Trust)"

# =======================================================================
# Configuration Generated Successfully!
