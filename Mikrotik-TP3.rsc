# 2026-05-21 11:30:15 by RouterOS 7.20.6
# software id = DNSX-F30B
#
# model = CCR2116-12G-4S+
# serial number = HG609SABGZS
/interface bridge
add comment="Transparent L2 Firewall for PoC" fast-forward=no name=\
    bridge-L2-poc vlan-filtering=yes
/interface vlan
add interface=bridge-L2-poc name=vlan201-mgmt vlan-id=201
/port
set 0 name=serial0
/interface bridge port
add bridge=bridge-L2-poc comment="To MUIC Core Switch (Uplink)" hw=no \
    interface=sfp-sfpplus1
add bridge=bridge-L2-poc comment="To DC Access Switches (Downlink)" hw=no \
    interface=ether2 pvid=21
/interface bridge settings
set allow-fast-path=no use-ip-firewall=yes use-ip-firewall-for-vlan=yes
/interface bridge vlan
add bridge=bridge-L2-poc tagged=sfp-sfpplus1 untagged=ether2 vlan-ids=21
add bridge=bridge-L2-poc tagged=sfp-sfpplus1,bridge-L2-poc vlan-ids=201
/ip address
add address=10.27.201.110/24 comment="Management IP" interface=vlan201-mgmt \
    network=10.27.201.0
/ip firewall address-list
add address=10.27.101.41 comment="Safeline WAF" list=poc-targets
add address=10.27.101.165 comment="Backend Apache" list=poc-targets
add address=10.27.101.41 comment="Safeline WAF" list=waf-frontend
add address=10.27.101.0/24 comment="IT Admin Network (Allow SSH)" list=\
    admin-management
add address=10.27.101.1 comment=cc-main list=allow-port-22-servers
add address=10.27.101.9 comment=web-portal list=allow-port-22-servers
add address=10.27.101.21 comment=TestLabs-21-101-200 list=\
    allow-port-22-servers
add address=10.27.101.22 comment=Test-App-02_os.muic.io list=\
    allow-port-22-servers
add address=10.27.101.23 comment=Test-App-03_teedy list=allow-port-22-servers
add address=10.27.101.25 comment=Net-NPS-200_unifi-controller list=\
    allow-port-22-servers
add address=10.27.101.27 comment=IC-Payment-v2 list=allow-port-22-servers
add address=10.27.101.34 comment=keycloak-200-1 list=allow-port-22-servers
add address=10.27.101.35 comment=minio list=allow-port-22-servers
add address=10.27.101.38 comment=ED-WP_ed-wp list=allow-port-22-servers
add address=10.27.101.46 comment=Airflow list=allow-port-22-servers
add address=10.27.101.52 comment=ic-db-200 list=allow-port-22-servers
add address=10.27.101.71 comment=kong-api list=allow-port-22-servers
add address=10.27.101.77 comment=ubu-poc_Legacy-App-03 list=\
    allow-port-22-servers
add address=10.27.101.83 comment=Sci-Div-01v2_cs.muic.mahidol.ac.th list=\
    allow-port-22-servers
add address=10.27.101.87 comment=Kong-Legacy-199_Routing list=\
    allow-port-22-servers
add address=10.27.101.91 comment=it-helpdesk list=allow-port-22-servers
add address=10.27.101.98 comment=muproxy-243 list=allow-port-22-servers
add address=10.27.101.114 comment=swarm-234 list=allow-port-22-servers
add address=10.27.101.115 comment=swarm-243 list=allow-port-22-servers
add address=10.27.101.116 comment=swarm-200 list=allow-port-22-servers
add address=10.27.101.117 comment=swarm-199 list=allow-port-22-servers
add address=10.27.101.153 comment=keycloak-199 list=allow-port-22-servers
add address=10.27.101.154 comment=Wifi-DNSMASQ list=allow-port-22-servers
add address=10.27.101.203 comment=k3s-Control list=allow-port-22-servers
add address=10.27.101.210 comment=sky-Grad-Portal list=allow-port-22-servers
add address=10.27.101.211 comment=Wazuh-munet list=allow-port-22-servers
add address=10.27.101.232 comment=KeystoneApp-Prod-01_kapp01 list=\
    allow-port-22-servers
add address=10.27.101.236 comment=ks-nfs list=allow-port-22-servers
add address=10.27.101.247 comment=mail-relay list=allow-port-25-servers
add address=10.27.101.154 comment=Wifi-DNSMASQ list=allow-port-53-servers
add address=10.27.101.1 comment=cc-main list=allow-port-80-servers
add address=10.27.101.2 list=allow-port-80-servers
add address=10.27.101.3 comment=waf-oasis list=allow-port-80-servers
add address=10.27.101.4 comment=netflow_testing_till_31MAY2026 list=\
    allow-port-80-servers
add address=10.27.101.5 comment=netflow_testing__till_31MAY2026 list=\
    allow-port-80-servers
add address=10.27.101.6 list=allow-port-80-servers
add address=10.27.101.9 comment=web-portal list=allow-port-80-servers
add address=10.27.101.13 comment=WAF_-_pconline list=allow-port-80-servers
add address=10.27.101.25 comment=Net-NPS-200_unifi-controller list=\
    allow-port-80-servers
add address=10.27.101.27 comment=IC-Payment-v2 list=allow-port-80-servers
add address=10.27.101.38 comment=ED-WP_ed-wp list=allow-port-80-servers
add address=10.27.101.47 comment=EDX-App-251 list=allow-port-80-servers
add address=10.27.101.53 comment=waf-poc list=allow-port-80-servers
add address=10.27.101.66 comment=waf-lib list=allow-port-80-servers
add address=10.27.101.77 comment=ubu-poc_Legacy-App-03 list=\
    allow-port-80-servers
add address=10.27.101.83 comment=Sci-Div-01v2_cs.muic.mahidol.ac.th list=\
    allow-port-80-servers
add address=10.27.101.87 comment=Kong-Legacy-199_Routing list=\
    allow-port-80-servers
add address=10.27.101.89 comment=HR_Plus list=allow-port-80-servers
add address=10.27.101.90 comment=QNAP-17 list=allow-port-80-servers
add address=10.27.101.91 comment=it-helpdesk list=allow-port-80-servers
add address=10.27.101.98 comment=muproxy-243 list=allow-port-80-servers
add address=10.27.101.154 comment=Wifi-DNSMASQ list=allow-port-80-servers
add address=10.27.101.167 comment=Zabbix list=allow-port-80-servers
add address=10.27.101.209 comment=GLPI list=allow-port-80-servers
add address=10.27.101.210 comment=sky-Grad-Portal list=allow-port-80-servers
add address=10.27.101.225 list=allow-port-80-servers
add address=10.27.101.102 comment=muic.ad.muic.io list=allow-port-88-servers
add address=10.27.101.10 comment=QNAP-20 list=allow-port-111-servers
add address=10.27.101.58 comment=QNAP-07 list=allow-port-111-servers
add address=10.27.101.64 comment=QNAP-10 list=allow-port-111-servers
add address=10.27.101.90 comment=QNAP-17 list=allow-port-111-servers
add address=10.27.101.102 comment=muic.ad.muic.io list=allow-port-135-servers
add address=10.27.101.55 comment=QNAP-01 list=allow-port-139-servers
add address=10.27.101.88 comment=QNAP-16 list=allow-port-139-servers
add address=10.27.101.90 comment=QNAP-17 list=allow-port-139-servers
add address=10.27.101.102 comment=muic.ad.muic.io list=allow-port-389-servers
add address=10.27.101.1 comment=cc-main list=allow-port-443-servers
add address=10.27.101.2 list=allow-port-443-servers
add address=10.27.101.3 comment=waf-oasis list=allow-port-443-servers
add address=10.27.101.4 comment=netflow_testing_till_31MAY2026 list=\
    allow-port-443-servers
add address=10.27.101.5 comment=netflow_testing__till_31MAY2026 list=\
    allow-port-443-servers
add address=10.27.101.6 list=allow-port-443-servers
add address=10.27.101.9 comment=web-portal list=allow-port-443-servers
add address=10.27.101.10 comment=QNAP-20 list=allow-port-443-servers
add address=10.27.101.13 comment=WAF_-_pconline list=allow-port-443-servers
add address=10.27.101.20 comment=Multi-01_APACHE_GUACAMOLE list=\
    allow-port-443-servers
add address=10.27.101.27 comment=IC-Payment-v2 list=allow-port-443-servers
add address=10.27.101.38 comment=ED-WP_ed-wp list=allow-port-443-servers
add address=10.27.101.47 comment=EDX-App-251 list=allow-port-443-servers
add address=10.27.101.53 comment=waf-poc list=allow-port-443-servers
add address=10.27.101.57 comment=QNAP-06 list=allow-port-443-servers
add address=10.27.101.58 comment=QNAP-07 list=allow-port-443-servers
add address=10.27.101.60 comment=QNAP-09-Lib list=allow-port-443-servers
add address=10.27.101.64 comment=QNAP-10 list=allow-port-443-servers
add address=10.27.101.66 comment=waf-lib list=allow-port-443-servers
add address=10.27.101.70 comment=QNAP-14 list=allow-port-443-servers
add address=10.27.101.80 comment=QNAP-15 list=allow-port-443-servers
add address=10.27.101.83 comment=Sci-Div-01v2_cs.muic.mahidol.ac.th list=\
    allow-port-443-servers
add address=10.27.101.87 comment=Kong-Legacy-199_Routing list=\
    allow-port-443-servers
add address=10.27.101.88 comment=QNAP-16 list=allow-port-443-servers
add address=10.27.101.90 comment=QNAP-17 list=allow-port-443-servers
add address=10.27.101.98 comment=muproxy-243 list=allow-port-443-servers
add address=10.27.101.126 comment=HP_Proliant_DL380G7 list=\
    allow-port-443-servers
add address=10.27.101.134 comment=HP_Proliant_DL560_Gen_8_SKY list=\
    allow-port-443-servers
add address=10.27.101.167 comment=Zabbix list=allow-port-443-servers
add address=10.27.101.199 comment=DELL_PowerEdge_R750 list=\
    allow-port-443-servers
add address=10.27.101.200 comment=DELL_PowerEdge_R750 list=\
    allow-port-443-servers
add address=10.27.101.211 comment=Wazuh-munet list=allow-port-443-servers
add address=10.27.101.230 comment=DELL_PowerEdge_630 list=\
    allow-port-443-servers
add address=10.27.101.234 comment=DELL_PowerEdge_640_SKY+ list=\
    allow-port-443-servers
add address=10.27.101.240 comment=DELL_PowerEdge_630 list=\
    allow-port-443-servers
add address=10.27.101.243 comment=DELL_PowerEdge_640_SKY+ list=\
    allow-port-443-servers
add address=10.27.101.251 comment=DELL_PowerEdge_R610 list=\
    allow-port-443-servers
add address=10.27.101.1 comment=cc-main list=allow-port-445-servers
add address=10.27.101.2 list=allow-port-445-servers
add address=10.27.101.3 comment=waf-oasis list=allow-port-445-servers
add address=10.27.101.4 comment=netflow_testing_till_31MAY2026 list=\
    allow-port-445-servers
add address=10.27.101.5 comment=netflow_testing__till_31MAY2026 list=\
    allow-port-445-servers
add address=10.27.101.6 list=allow-port-445-servers
add address=10.27.101.7 comment=netflow_testing__till_31MAY2026 list=\
    allow-port-445-servers
add address=10.27.101.8 comment=netflow_testing__till_31MAY2026 list=\
    allow-port-445-servers
add address=10.27.101.9 comment=web-portal list=allow-port-445-servers
add address=10.27.101.10 comment=QNAP-20 list=allow-port-445-servers
add address=10.27.101.11 comment=teedy-app list=allow-port-445-servers
add address=10.27.101.13 comment=WAF_-_pconline list=allow-port-445-servers
add address=10.27.101.18 comment=Web-Lib_WP_libwp list=allow-port-445-servers
add address=10.27.101.20 comment=Multi-01_APACHE_GUACAMOLE list=\
    allow-port-445-servers
add address=10.27.101.21 comment=TestLabs-21-101-200 list=\
    allow-port-445-servers
add address=10.27.101.22 comment=Test-App-02_os.muic.io list=\
    allow-port-445-servers
add address=10.27.101.23 comment=Test-App-03_teedy list=\
    allow-port-445-servers
add address=10.27.101.24 comment=packetfence list=allow-port-445-servers
add address=10.27.101.25 comment=Net-NPS-200_unifi-controller list=\
    allow-port-445-servers
add address=10.27.101.26 comment=netbox list=allow-port-445-servers
add address=10.27.101.27 comment=IC-Payment-v2 list=allow-port-445-servers
add address=10.27.101.28 list=allow-port-445-servers
add address=10.27.101.29 list=allow-port-445-servers
add address=10.27.101.32 comment=Graylog list=allow-port-445-servers
add address=10.27.101.34 comment=keycloak-200-1 list=allow-port-445-servers
add address=10.27.101.35 comment=minio list=allow-port-445-servers
add address=10.27.101.38 comment=ED-WP_ed-wp list=allow-port-445-servers
add address=10.27.101.40 comment=DB-IC-199_db-0 list=allow-port-445-servers
add address=10.27.101.45 list=allow-port-445-servers
add address=10.27.101.46 comment=Airflow list=allow-port-445-servers
add address=10.27.101.47 comment=EDX-App-251 list=allow-port-445-servers
add address=10.27.101.50 list=allow-port-445-servers
add address=10.27.101.52 comment=ic-db-200 list=allow-port-445-servers
add address=10.27.101.53 comment=waf-poc list=allow-port-445-servers
add address=10.27.101.54 comment=VEEAM-11-03 list=allow-port-445-servers
add address=10.27.101.55 comment=QNAP-01 list=allow-port-445-servers
add address=10.27.101.57 comment=QNAP-06 list=allow-port-445-servers
add address=10.27.101.58 comment=QNAP-07 list=allow-port-445-servers
add address=10.27.101.60 comment=QNAP-09-Lib list=allow-port-445-servers
add address=10.27.101.61 comment=legacy-nfs list=allow-port-445-servers
add address=10.27.101.63 comment=VEEAM-11-04 list=allow-port-445-servers
add address=10.27.101.64 comment=QNAP-10 list=allow-port-445-servers
add address=10.27.101.66 comment=waf-lib list=allow-port-445-servers
add address=10.27.101.68 comment=QNAP-13 list=allow-port-445-servers
add address=10.27.101.70 comment=QNAP-14 list=allow-port-445-servers
add address=10.27.101.71 comment=kong-api list=allow-port-445-servers
add address=10.27.101.76 comment=VEEAM-Backup-11 list=allow-port-445-servers
add address=10.27.101.77 comment=ubu-poc_Legacy-App-03 list=\
    allow-port-445-servers
add address=10.27.101.80 comment=QNAP-15 list=allow-port-445-servers
add address=10.27.101.83 comment=Sci-Div-01v2_cs.muic.mahidol.ac.th list=\
    allow-port-445-servers
add address=10.27.101.85 comment=VEEAM-11-02 list=allow-port-445-servers
add address=10.27.101.87 comment=Kong-Legacy-199_Routing list=\
    allow-port-445-servers
add address=10.27.101.88 comment=QNAP-16 list=allow-port-445-servers
add address=10.27.101.89 comment=HR_Plus list=allow-port-445-servers
add address=10.27.101.90 comment=QNAP-17 list=allow-port-445-servers
add address=10.27.101.91 comment=it-helpdesk list=allow-port-445-servers
add address=10.27.101.93 comment=dspace list=allow-port-445-servers
add address=10.27.101.98 comment=muproxy-243 list=allow-port-445-servers
add address=10.27.101.102 comment=muic.ad.muic.io list=allow-port-445-servers
add address=10.27.101.106 list=allow-port-445-servers
add address=10.27.101.108 list=allow-port-445-servers
add address=10.27.101.113 comment=apisix-demo list=allow-port-445-servers
add address=10.27.101.114 comment=swarm-234 list=allow-port-445-servers
add address=10.27.101.115 comment=swarm-243 list=allow-port-445-servers
add address=10.27.101.116 comment=swarm-200 list=allow-port-445-servers
add address=10.27.101.117 comment=swarm-199 list=allow-port-445-servers
add address=10.27.101.118 comment=ic-elearning list=allow-port-445-servers
add address=10.27.101.126 comment=HP_Proliant_DL380G7 list=\
    allow-port-445-servers
add address=10.27.101.132 comment=k8s_control list=allow-port-445-servers
add address=10.27.101.133 comment=Cloud-sync.muic.io list=\
    allow-port-445-servers
add address=10.27.101.134 comment=HP_Proliant_DL560_Gen_8_SKY list=\
    allow-port-445-servers
add address=10.27.101.135 list=allow-port-445-servers
add address=10.27.101.141 comment=k3s-node-01 list=allow-port-445-servers
add address=10.27.101.142 comment=k3s-node-02_node-02 list=\
    allow-port-445-servers
add address=10.27.101.143 comment=k3s-node-03 list=allow-port-445-servers
add address=10.27.101.144 list=allow-port-445-servers
add address=10.27.101.149 comment=DELL_PowerEdge_R610 list=\
    allow-port-445-servers
add address=10.27.101.150 comment=WinDBTStart-01-134 list=\
    allow-port-445-servers
add address=10.27.101.153 comment=keycloak-199 list=allow-port-445-servers
add address=10.27.101.154 comment=Wifi-DNSMASQ list=allow-port-445-servers
add address=10.27.101.166 comment=Web-Dspace-126_Rev03 list=\
    allow-port-445-servers
add address=10.27.101.167 comment=Zabbix list=allow-port-445-servers
add address=10.27.101.194 comment=Ubuntu-Prometheus list=\
    allow-port-445-servers
add address=10.27.101.197 comment=Ubuntu-For_Testing list=\
    allow-port-445-servers
add address=10.27.101.199 comment=DELL_PowerEdge_R750 list=\
    allow-port-445-servers
add address=10.27.101.200 comment=DELL_PowerEdge_R750 list=\
    allow-port-445-servers
add address=10.27.101.201 comment=DELL_PowerEdge_R610 list=\
    allow-port-445-servers
add address=10.27.101.203 comment=k3s-Control list=allow-port-445-servers
add address=10.27.101.205 comment=DELL_PowerEdge_R610 list=\
    allow-port-445-servers
add address=10.27.101.206 comment=ic-data list=allow-port-445-servers
add address=10.27.101.207 list=allow-port-445-servers
add address=10.27.101.209 comment=GLPI list=allow-port-445-servers
add address=10.27.101.211 comment=Wazuh-munet list=allow-port-445-servers
add address=10.27.101.213 list=allow-port-445-servers
add address=10.27.101.216 comment=swarm-NFS-199_web-enroll list=\
    allow-port-445-servers
add address=10.27.101.221 list=allow-port-445-servers
add address=10.27.101.222 list=allow-port-445-servers
add address=10.27.101.224 list=allow-port-445-servers
add address=10.27.101.225 list=allow-port-445-servers
add address=10.27.101.229 list=allow-port-445-servers
add address=10.27.101.230 comment=DELL_PowerEdge_630 list=\
    allow-port-445-servers
add address=10.27.101.232 comment=KeystoneApp-Prod-01_kapp01 list=\
    allow-port-445-servers
add address=10.27.101.234 comment=DELL_PowerEdge_640_SKY+ list=\
    allow-port-445-servers
add address=10.27.101.235 comment=KeystoneApp-UAT list=allow-port-445-servers
add address=10.27.101.236 comment=ks-nfs list=allow-port-445-servers
add address=10.27.101.240 comment=DELL_PowerEdge_630 list=\
    allow-port-445-servers
add address=10.27.101.243 comment=DELL_PowerEdge_640_SKY+ list=\
    allow-port-445-servers
add address=10.27.101.244 comment=Keystone-DB-01 list=allow-port-445-servers
add address=10.27.101.245 comment=Keystone-DB-02 list=allow-port-445-servers
add address=10.27.101.247 comment=mail-relay list=allow-port-445-servers
add address=10.27.101.248 comment=mail-relay-ED-200 list=\
    allow-port-445-servers
add address=10.27.101.251 comment=DELL_PowerEdge_R610 list=\
    allow-port-445-servers
add address=10.27.101.154 comment=Wifi-DNSMASQ list=allow-port-853-servers
add address=10.27.101.108 list=allow-port-1024-servers
add address=10.27.101.206 comment=ic-data list=allow-port-1433-servers
add address=10.27.101.245 comment=Keystone-DB-02 list=allow-port-1433-servers
add address=10.27.101.5 comment=netflow_testing__till_31MAY2026 list=\
    allow-port-1521-servers
add address=10.27.101.54 comment=VEEAM-11-03 list=allow-port-3389-servers
add address=10.27.101.63 comment=VEEAM-11-04 list=allow-port-3389-servers
add address=10.27.101.76 comment=VEEAM-Backup-11 list=allow-port-3389-servers
add address=10.27.101.85 comment=VEEAM-11-02 list=allow-port-3389-servers
add address=10.27.101.102 comment=muic.ad.muic.io list=\
    allow-port-3389-servers
add address=10.27.101.133 comment=Cloud-sync.muic.io list=\
    allow-port-3389-servers
add address=10.27.101.213 list=allow-port-3389-servers
add address=10.27.101.244 comment=Keystone-DB-01 list=allow-port-3389-servers
add address=10.27.101.245 comment=Keystone-DB-02 list=allow-port-3389-servers
add address=10.27.101.26 comment=netbox list=allow-port-8000-servers
add address=10.27.101.108 list=allow-port-8000-servers
add address=10.27.101.108 list=allow-port-8002-servers
add address=10.27.101.25 comment=Net-NPS-200_unifi-controller list=\
    allow-port-8080-servers
add address=10.27.101.77 comment=ubu-poc_Legacy-App-03 list=\
    allow-port-8080-servers
add address=10.27.101.88 comment=QNAP-16 list=allow-port-8080-servers
add address=10.27.101.108 list=allow-port-8080-servers
add address=10.27.101.166 comment=Web-Dspace-126_Rev03 list=\
    allow-port-8080-servers
add address=10.27.101.18 comment=Web-Lib_WP_libwp list=\
    allow-port-8081-servers
add address=10.27.101.46 comment=Airflow list=allow-port-8081-servers
add address=10.27.101.25 comment=Net-NPS-200_unifi-controller list=\
    allow-port-8443-servers
add address=10.27.101.108 list=allow-port-8888-servers
add address=10.27.101.32 comment=Graylog list=allow-port-9000-servers
add address=10.27.101.108 list=allow-port-9000-servers
add address=10.27.101.108 list=allow-port-9200-servers
add address=10.27.101.108 list=allow-port-10051-servers
add address=10.27.101.167 comment=Zabbix list=allow-port-10051-servers
/ip firewall filter
add action=accept chain=forward comment="[01] ACCEPT ESTABLISHED/RELATED" \
    connection-state=established,related
add action=drop chain=forward comment="[02] DROP INVALID" connection-state=\
    invalid
add action=accept chain=forward comment=\
    "[03] ALLOW ICMP (PING) FOR VERIFICATION" protocol=icmp
add action=accept chain=forward comment=\
    "[03-A] ALLOW PUBLIC WEB TRAFFIC TO WAF" dst-address-list=waf-frontend \
    dst-port=80,443 protocol=tcp
add action=accept chain=forward comment="[03-B] ALLOW WAF TO BACKEND APACHE" \
    dst-address=10.27.101.165 dst-port=8881 protocol=tcp src-address=\
    10.27.101.41
add action=accept chain=forward comment=\
    "[04] ALLOW SSH TO POC FROM ADMIN VLAN ONLY" dst-address-list=poc-targets \
    dst-port=22,9443 protocol=tcp src-address-list=admin-management
add action=accept chain=forward comment="[05] ALLOW SSH (TCP)" \
    dst-address-list=allow-port-22-servers dst-port=22 protocol=tcp
add action=accept chain=forward comment="[06] ALLOW PORT_25 (TCP)" \
    dst-address-list=allow-port-25-servers dst-port=25 protocol=tcp
add action=accept chain=forward comment="[07] ALLOW DNS (TCP)" \
    dst-address-list=allow-port-53-servers dst-port=53 protocol=tcp
add action=accept chain=forward comment="[08] ALLOW HTTP (TCP)" \
    dst-address-list=allow-port-80-servers dst-port=80 protocol=tcp
add action=accept chain=forward comment="[09] ALLOW PORT_88 (TCP)" \
    dst-address-list=allow-port-88-servers dst-port=88 protocol=tcp
add action=accept chain=forward comment="[10] ALLOW PORT_111 (TCP)" \
    dst-address-list=allow-port-111-servers dst-port=111 protocol=tcp
add action=accept chain=forward comment="[11] ALLOW PORT_135 (TCP)" \
    dst-address-list=allow-port-135-servers dst-port=135 protocol=tcp
add action=accept chain=forward comment="[12] ALLOW PORT_139 (TCP)" \
    dst-address-list=allow-port-139-servers dst-port=139 protocol=tcp
add action=accept chain=forward comment="[13] ALLOW PORT_389 (TCP)" \
    dst-address-list=allow-port-389-servers dst-port=389 protocol=tcp
add action=accept chain=forward comment="[14] ALLOW HTTPS (TCP)" \
    dst-address-list=allow-port-443-servers dst-port=443 protocol=tcp
add action=accept chain=forward comment="[15] ALLOW PORT_445 (TCP)" \
    dst-address-list=allow-port-445-servers dst-port=445 protocol=tcp
add action=accept chain=forward comment="[16] ALLOW PORT_853 (TCP)" \
    dst-address-list=allow-port-853-servers dst-port=853 protocol=tcp
add action=accept chain=forward comment="[17] ALLOW PORT_1024 (TCP)" \
    dst-address-list=allow-port-1024-servers dst-port=1024 protocol=tcp
add action=accept chain=forward comment="[18] ALLOW PORT_1433 (TCP)" \
    dst-address-list=allow-port-1433-servers dst-port=1433 protocol=tcp
add action=accept chain=forward comment="[19] ALLOW PORT_1521 (TCP)" \
    dst-address-list=allow-port-1521-servers dst-port=1521 protocol=tcp
add action=accept chain=forward comment="[20] ALLOW RDP (TCP)" \
    dst-address-list=allow-port-3389-servers dst-port=3389 protocol=tcp
add action=accept chain=forward comment="[21] ALLOW PORT_8000 (TCP)" \
    dst-address-list=allow-port-8000-servers dst-port=8000 protocol=tcp
add action=accept chain=forward comment="[22] ALLOW PORT_8002 (TCP)" \
    dst-address-list=allow-port-8002-servers dst-port=8002 protocol=tcp
add action=accept chain=forward comment="[23] ALLOW PORT_8080 (TCP)" \
    dst-address-list=allow-port-8080-servers dst-port=8080 protocol=tcp
add action=accept chain=forward comment="[24] ALLOW PORT_8081 (TCP)" \
    dst-address-list=allow-port-8081-servers dst-port=8081 protocol=tcp
add action=accept chain=forward comment="[25] ALLOW PORT_8443 (TCP)" \
    dst-address-list=allow-port-8443-servers dst-port=8443 protocol=tcp
add action=accept chain=forward comment="[26] ALLOW PORT_8888 (TCP)" \
    dst-address-list=allow-port-8888-servers dst-port=8888 protocol=tcp
add action=accept chain=forward comment="[27] ALLOW PORT_9000 (TCP)" \
    dst-address-list=allow-port-9000-servers dst-port=9000 protocol=tcp
add action=accept chain=forward comment="[28] ALLOW PORT_9200 (TCP)" \
    dst-address-list=allow-port-9200-servers dst-port=9200 protocol=tcp
add action=accept chain=forward comment="[29] ALLOW PORT_10051 (TCP)" \
    dst-address-list=allow-port-10051-servers dst-port=10051 protocol=tcp
add action=drop chain=forward comment=\
    "[99] SAFE PoC ZERO-TRUST DROP (Currently enforced on WAF/Backend only)" \
    dst-address-list=poc-targets
/ip firewall service-port
set h323 disabled=yes
set sip disabled=yes
set pptp disabled=yes
/ip route
add comment="Default Gateway for Management" gateway=10.27.201.254
/ip service
set ftp disabled=yes
set ssh address=10.27.100.0/24,10.27.101.0/24,192.168.64.0/20
set telnet disabled=yes
set www disabled=yes
set winbox address=10.27.100.0/24,10.27.101.0/24,192.168.64.0/20
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Asia/Bangkok
/system identity
set name=MKT-TP-FW
/system ntp client servers
add address=10.27.1.201
/system routerboard settings
set enter-setup-on=delete-key
