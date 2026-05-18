# 🔌 Draft Whitelist ACL (By Service / Port)
> **มุมมองที่ 2:** ตรวจสอบแบบกลุ่มบริการ เช่น พอร์ต 22 (SSH) ควรมี Server เครื่องไหนบ้างที่ถูกเปิดให้เข้าถึงได้ (เพื่อป้องกันการเปิดพอร์ตจัดการระบบพร่ำเพรื่อ)

## 🌐 Port 22 (TCP)
**Total Internal Hosts providing this service:** 29

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.1 | cc-main | [ ] Valid / [ ] Invalid | |
| 10.27.101.9 | web-portal | [ ] Valid / [ ] Invalid | |
| 10.27.101.21 | TestLabs-21-101-200 | [ ] Valid / [ ] Invalid | |
| 10.27.101.22 | Test-App-02 (os.muic.io) | [ ] Valid / [ ] Invalid | |
| 10.27.101.23 | Test-App-03 (teedy) | [ ] Valid / [ ] Invalid | |
| 10.27.101.25 | Net-NPS-200 (unifi-controller) | [ ] Valid / [ ] Invalid | |
| 10.27.101.27 | IC-Payment-v2 | [ ] Valid / [ ] Invalid | |
| 10.27.101.34 | keycloak-200-1 | [ ] Valid / [ ] Invalid | |
| 10.27.101.35 | minio | [ ] Valid / [ ] Invalid | |
| 10.27.101.38 | ED-WP (ed-wp) | [ ] Valid / [ ] Invalid | |
| 10.27.101.46 | Airflow | [ ] Valid / [ ] Invalid | |
| 10.27.101.52 | ic-db-200 | [ ] Valid / [ ] Invalid | |
| 10.27.101.71 | kong-api | [ ] Valid / [ ] Invalid | |
| 10.27.101.77 | ubu-poc (Legacy-App-03) | [ ] Valid / [ ] Invalid | |
| 10.27.101.83 | Sci-Div-01v2 (cs.muic.mahidol.ac.th) | [ ] Valid / [ ] Invalid | |
| 10.27.101.87 | Kong-Legacy-199 (Routing) | [ ] Valid / [ ] Invalid | |
| 10.27.101.91 | it-helpdesk | [ ] Valid / [ ] Invalid | |
| 10.27.101.98 | muproxy-243 | [ ] Valid / [ ] Invalid | |
| 10.27.101.114 | swarm-234 | [ ] Valid / [ ] Invalid | |
| 10.27.101.115 | swarm-243 | [ ] Valid / [ ] Invalid | |
| 10.27.101.116 | swarm-200 | [ ] Valid / [ ] Invalid | |
| 10.27.101.117 | swarm-199 | [ ] Valid / [ ] Invalid | |
| 10.27.101.153 | keycloak-199 | [ ] Valid / [ ] Invalid | |
| 10.27.101.154 | Wifi-DNSMASQ | [ ] Valid / [ ] Invalid | |
| 10.27.101.203 | k3s-Control | [ ] Valid / [ ] Invalid | |
| 10.27.101.210 | sky-Grad-Portal | [ ] Valid / [ ] Invalid | |
| 10.27.101.211 | Wazuh-munet | [ ] Valid / [ ] Invalid | |
| 10.27.101.232 | KeystoneApp-Prod-01 (kapp01) | [ ] Valid / [ ] Invalid | |
| 10.27.101.236 | ks-nfs | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 25 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.247 | mail-relay | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 53 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.154 | Wifi-DNSMASQ | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 80 (TCP)
**Total Internal Hosts providing this service:** 27

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.1 | cc-main | [ ] Valid / [ ] Invalid | |
| 10.27.101.2 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.3 | waf-oasis | [ ] Valid / [ ] Invalid | |
| 10.27.101.4 | netflow testing (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.5 | netflow testing  (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.6 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.9 | web-portal | [ ] Valid / [ ] Invalid | |
| 10.27.101.13 | WAF - pconline | [ ] Valid / [ ] Invalid | |
| 10.27.101.25 | Net-NPS-200 (unifi-controller) | [ ] Valid / [ ] Invalid | |
| 10.27.101.27 | IC-Payment-v2 | [ ] Valid / [ ] Invalid | |
| 10.27.101.38 | ED-WP (ed-wp) | [ ] Valid / [ ] Invalid | |
| 10.27.101.41 | waf-wiki | [ ] Valid / [ ] Invalid | |
| 10.27.101.47 | EDX-App-251 | [ ] Valid / [ ] Invalid | |
| 10.27.101.53 | waf-poc | [ ] Valid / [ ] Invalid | |
| 10.27.101.66 | waf-lib | [ ] Valid / [ ] Invalid | |
| 10.27.101.77 | ubu-poc (Legacy-App-03) | [ ] Valid / [ ] Invalid | |
| 10.27.101.83 | Sci-Div-01v2 (cs.muic.mahidol.ac.th) | [ ] Valid / [ ] Invalid | |
| 10.27.101.87 | Kong-Legacy-199 (Routing) | [ ] Valid / [ ] Invalid | |
| 10.27.101.89 | HR Plus | [ ] Valid / [ ] Invalid | |
| 10.27.101.90 | QNAP-17 | [ ] Valid / [ ] Invalid | |
| 10.27.101.91 | it-helpdesk | [ ] Valid / [ ] Invalid | |
| 10.27.101.98 | muproxy-243 | [ ] Valid / [ ] Invalid | |
| 10.27.101.154 | Wifi-DNSMASQ | [ ] Valid / [ ] Invalid | |
| 10.27.101.167 | Zabbix | [ ] Valid / [ ] Invalid | |
| 10.27.101.209 | GLPI | [ ] Valid / [ ] Invalid | |
| 10.27.101.210 | sky-Grad-Portal | [ ] Valid / [ ] Invalid | |
| 10.27.101.225 |  | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 88 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.102 | muic.ad.muic.io | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 111 (TCP)
**Total Internal Hosts providing this service:** 4

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.10 | QNAP-20 | [ ] Valid / [ ] Invalid | |
| 10.27.101.58 | QNAP-07 | [ ] Valid / [ ] Invalid | |
| 10.27.101.64 | QNAP-10 | [ ] Valid / [ ] Invalid | |
| 10.27.101.90 | QNAP-17 | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 135 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.102 | muic.ad.muic.io | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 139 (TCP)
**Total Internal Hosts providing this service:** 3

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.55 | QNAP-01 | [ ] Valid / [ ] Invalid | |
| 10.27.101.88 | QNAP-16 | [ ] Valid / [ ] Invalid | |
| 10.27.101.90 | QNAP-17 | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 389 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.102 | muic.ad.muic.io | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 443 (TCP)
**Total Internal Hosts providing this service:** 38

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.1 | cc-main | [ ] Valid / [ ] Invalid | |
| 10.27.101.2 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.3 | waf-oasis | [ ] Valid / [ ] Invalid | |
| 10.27.101.4 | netflow testing (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.5 | netflow testing  (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.6 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.9 | web-portal | [ ] Valid / [ ] Invalid | |
| 10.27.101.10 | QNAP-20 | [ ] Valid / [ ] Invalid | |
| 10.27.101.13 | WAF - pconline | [ ] Valid / [ ] Invalid | |
| 10.27.101.20 | Multi-01 (APACHE GUACAMOLE) | [ ] Valid / [ ] Invalid | |
| 10.27.101.27 | IC-Payment-v2 | [ ] Valid / [ ] Invalid | |
| 10.27.101.38 | ED-WP (ed-wp) | [ ] Valid / [ ] Invalid | |
| 10.27.101.41 | waf-wiki | [ ] Valid / [ ] Invalid | |
| 10.27.101.47 | EDX-App-251 | [ ] Valid / [ ] Invalid | |
| 10.27.101.53 | waf-poc | [ ] Valid / [ ] Invalid | |
| 10.27.101.57 | QNAP-06 | [ ] Valid / [ ] Invalid | |
| 10.27.101.58 | QNAP-07 | [ ] Valid / [ ] Invalid | |
| 10.27.101.60 | QNAP-09-Lib | [ ] Valid / [ ] Invalid | |
| 10.27.101.64 | QNAP-10 | [ ] Valid / [ ] Invalid | |
| 10.27.101.66 | waf-lib | [ ] Valid / [ ] Invalid | |
| 10.27.101.70 | QNAP-14 | [ ] Valid / [ ] Invalid | |
| 10.27.101.80 | QNAP-15 | [ ] Valid / [ ] Invalid | |
| 10.27.101.83 | Sci-Div-01v2 (cs.muic.mahidol.ac.th) | [ ] Valid / [ ] Invalid | |
| 10.27.101.87 | Kong-Legacy-199 (Routing) | [ ] Valid / [ ] Invalid | |
| 10.27.101.88 | QNAP-16 | [ ] Valid / [ ] Invalid | |
| 10.27.101.90 | QNAP-17 | [ ] Valid / [ ] Invalid | |
| 10.27.101.98 | muproxy-243 | [ ] Valid / [ ] Invalid | |
| 10.27.101.126 | HP Proliant DL380G7 | [ ] Valid / [ ] Invalid | |
| 10.27.101.134 | HP Proliant DL560 Gen 8 (SKY) | [ ] Valid / [ ] Invalid | |
| 10.27.101.167 | Zabbix | [ ] Valid / [ ] Invalid | |
| 10.27.101.199 | DELL PowerEdge R750 | [ ] Valid / [ ] Invalid | |
| 10.27.101.200 | DELL PowerEdge R750 | [ ] Valid / [ ] Invalid | |
| 10.27.101.211 | Wazuh-munet | [ ] Valid / [ ] Invalid | |
| 10.27.101.230 | DELL PowerEdge 630 | [ ] Valid / [ ] Invalid | |
| 10.27.101.234 | DELL PowerEdge 640 (SKY+) | [ ] Valid / [ ] Invalid | |
| 10.27.101.240 | DELL PowerEdge 630 | [ ] Valid / [ ] Invalid | |
| 10.27.101.243 | DELL PowerEdge 640 (SKY+) | [ ] Valid / [ ] Invalid | |
| 10.27.101.251 | DELL PowerEdge R610 | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 445 (TCP)
**Total Internal Hosts providing this service:** 114

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.1 | cc-main | [ ] Valid / [ ] Invalid | |
| 10.27.101.2 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.3 | waf-oasis | [ ] Valid / [ ] Invalid | |
| 10.27.101.4 | netflow testing (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.5 | netflow testing  (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.6 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.7 | netflow testing  (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.8 | netflow testing  (till 31MAY2026) | [ ] Valid / [ ] Invalid | |
| 10.27.101.9 | web-portal | [ ] Valid / [ ] Invalid | |
| 10.27.101.10 | QNAP-20 | [ ] Valid / [ ] Invalid | |
| 10.27.101.11 | teedy-app | [ ] Valid / [ ] Invalid | |
| 10.27.101.13 | WAF - pconline | [ ] Valid / [ ] Invalid | |
| 10.27.101.18 | Web-Lib WP (libwp) | [ ] Valid / [ ] Invalid | |
| 10.27.101.20 | Multi-01 (APACHE GUACAMOLE) | [ ] Valid / [ ] Invalid | |
| 10.27.101.21 | TestLabs-21-101-200 | [ ] Valid / [ ] Invalid | |
| 10.27.101.22 | Test-App-02 (os.muic.io) | [ ] Valid / [ ] Invalid | |
| 10.27.101.23 | Test-App-03 (teedy) | [ ] Valid / [ ] Invalid | |
| 10.27.101.24 | packetfence | [ ] Valid / [ ] Invalid | |
| 10.27.101.25 | Net-NPS-200 (unifi-controller) | [ ] Valid / [ ] Invalid | |
| 10.27.101.26 | netbox | [ ] Valid / [ ] Invalid | |
| 10.27.101.27 | IC-Payment-v2 | [ ] Valid / [ ] Invalid | |
| 10.27.101.28 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.29 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.32 | Graylog | [ ] Valid / [ ] Invalid | |
| 10.27.101.34 | keycloak-200-1 | [ ] Valid / [ ] Invalid | |
| 10.27.101.35 | minio | [ ] Valid / [ ] Invalid | |
| 10.27.101.38 | ED-WP (ed-wp) | [ ] Valid / [ ] Invalid | |
| 10.27.101.40 | DB-IC-199 (db-0) | [ ] Valid / [ ] Invalid | |
| 10.27.101.41 | waf-wiki | [ ] Valid / [ ] Invalid | |
| 10.27.101.45 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.46 | Airflow | [ ] Valid / [ ] Invalid | |
| 10.27.101.47 | EDX-App-251 | [ ] Valid / [ ] Invalid | |
| 10.27.101.50 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.52 | ic-db-200 | [ ] Valid / [ ] Invalid | |
| 10.27.101.53 | waf-poc | [ ] Valid / [ ] Invalid | |
| 10.27.101.54 | VEEAM-11-03 | [ ] Valid / [ ] Invalid | |
| 10.27.101.55 | QNAP-01 | [ ] Valid / [ ] Invalid | |
| 10.27.101.57 | QNAP-06 | [ ] Valid / [ ] Invalid | |
| 10.27.101.58 | QNAP-07 | [ ] Valid / [ ] Invalid | |
| 10.27.101.60 | QNAP-09-Lib | [ ] Valid / [ ] Invalid | |
| 10.27.101.61 | legacy-nfs | [ ] Valid / [ ] Invalid | |
| 10.27.101.63 | VEEAM-11-04 | [ ] Valid / [ ] Invalid | |
| 10.27.101.64 | QNAP-10 | [ ] Valid / [ ] Invalid | |
| 10.27.101.66 | waf-lib | [ ] Valid / [ ] Invalid | |
| 10.27.101.68 | QNAP-13 | [ ] Valid / [ ] Invalid | |
| 10.27.101.70 | QNAP-14 | [ ] Valid / [ ] Invalid | |
| 10.27.101.71 | kong-api | [ ] Valid / [ ] Invalid | |
| 10.27.101.76 | VEEAM-Backup-11 | [ ] Valid / [ ] Invalid | |
| 10.27.101.77 | ubu-poc (Legacy-App-03) | [ ] Valid / [ ] Invalid | |
| 10.27.101.80 | QNAP-15 | [ ] Valid / [ ] Invalid | |
| 10.27.101.83 | Sci-Div-01v2 (cs.muic.mahidol.ac.th) | [ ] Valid / [ ] Invalid | |
| 10.27.101.85 | VEEAM-11-02 | [ ] Valid / [ ] Invalid | |
| 10.27.101.87 | Kong-Legacy-199 (Routing) | [ ] Valid / [ ] Invalid | |
| 10.27.101.88 | QNAP-16 | [ ] Valid / [ ] Invalid | |
| 10.27.101.89 | HR Plus | [ ] Valid / [ ] Invalid | |
| 10.27.101.90 | QNAP-17 | [ ] Valid / [ ] Invalid | |
| 10.27.101.91 | it-helpdesk | [ ] Valid / [ ] Invalid | |
| 10.27.101.93 | dspace | [ ] Valid / [ ] Invalid | |
| 10.27.101.98 | muproxy-243 | [ ] Valid / [ ] Invalid | |
| 10.27.101.102 | muic.ad.muic.io | [ ] Valid / [ ] Invalid | |
| 10.27.101.106 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.113 | apisix-demo | [ ] Valid / [ ] Invalid | |
| 10.27.101.114 | swarm-234 | [ ] Valid / [ ] Invalid | |
| 10.27.101.115 | swarm-243 | [ ] Valid / [ ] Invalid | |
| 10.27.101.116 | swarm-200 | [ ] Valid / [ ] Invalid | |
| 10.27.101.117 | swarm-199 | [ ] Valid / [ ] Invalid | |
| 10.27.101.118 | ic-elearning | [ ] Valid / [ ] Invalid | |
| 10.27.101.126 | HP Proliant DL380G7 | [ ] Valid / [ ] Invalid | |
| 10.27.101.132 | k8s control | [ ] Valid / [ ] Invalid | |
| 10.27.101.133 | Cloud-sync.muic.io | [ ] Valid / [ ] Invalid | |
| 10.27.101.134 | HP Proliant DL560 Gen 8 (SKY) | [ ] Valid / [ ] Invalid | |
| 10.27.101.135 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.141 | k3s-node-01 | [ ] Valid / [ ] Invalid | |
| 10.27.101.142 | k3s-node-02 (node-02) | [ ] Valid / [ ] Invalid | |
| 10.27.101.143 | k3s-node-03 | [ ] Valid / [ ] Invalid | |
| 10.27.101.144 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.149 | DELL PowerEdge R610 | [ ] Valid / [ ] Invalid | |
| 10.27.101.150 | WinDBTStart-01-134 | [ ] Valid / [ ] Invalid | |
| 10.27.101.153 | keycloak-199 | [ ] Valid / [ ] Invalid | |
| 10.27.101.154 | Wifi-DNSMASQ | [ ] Valid / [ ] Invalid | |
| 10.27.101.165 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.166 | Web-Dspace-126 Rev03 | [ ] Valid / [ ] Invalid | |
| 10.27.101.167 | Zabbix | [ ] Valid / [ ] Invalid | |
| 10.27.101.194 | Ubuntu-Prometheus | [ ] Valid / [ ] Invalid | |
| 10.27.101.197 | Ubuntu-For Testing | [ ] Valid / [ ] Invalid | |
| 10.27.101.199 | DELL PowerEdge R750 | [ ] Valid / [ ] Invalid | |
| 10.27.101.200 | DELL PowerEdge R750 | [ ] Valid / [ ] Invalid | |
| 10.27.101.201 | DELL PowerEdge R610 | [ ] Valid / [ ] Invalid | |
| 10.27.101.203 | k3s-Control | [ ] Valid / [ ] Invalid | |
| 10.27.101.205 | DELL PowerEdge R610 | [ ] Valid / [ ] Invalid | |
| 10.27.101.206 | ic-data | [ ] Valid / [ ] Invalid | |
| 10.27.101.207 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.209 | GLPI | [ ] Valid / [ ] Invalid | |
| 10.27.101.211 | Wazuh-munet | [ ] Valid / [ ] Invalid | |
| 10.27.101.213 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.216 | swarm-NFS-199 (web-enroll) | [ ] Valid / [ ] Invalid | |
| 10.27.101.221 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.222 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.224 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.225 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.229 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.230 | DELL PowerEdge 630 | [ ] Valid / [ ] Invalid | |
| 10.27.101.232 | KeystoneApp-Prod-01 (kapp01) | [ ] Valid / [ ] Invalid | |
| 10.27.101.234 | DELL PowerEdge 640 (SKY+) | [ ] Valid / [ ] Invalid | |
| 10.27.101.235 | KeystoneApp-UAT | [ ] Valid / [ ] Invalid | |
| 10.27.101.236 | ks-nfs | [ ] Valid / [ ] Invalid | |
| 10.27.101.240 | DELL PowerEdge 630 | [ ] Valid / [ ] Invalid | |
| 10.27.101.243 | DELL PowerEdge 640 (SKY+) | [ ] Valid / [ ] Invalid | |
| 10.27.101.244 | Keystone-DB-01 | [ ] Valid / [ ] Invalid | |
| 10.27.101.245 | Keystone-DB-02 | [ ] Valid / [ ] Invalid | |
| 10.27.101.247 | mail-relay | [ ] Valid / [ ] Invalid | |
| 10.27.101.248 | mail-relay-ED-200 | [ ] Valid / [ ] Invalid | |
| 10.27.101.251 | DELL PowerEdge R610 | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 853 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.154 | Wifi-DNSMASQ | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 1024 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 1433 (TCP)
**Total Internal Hosts providing this service:** 2

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.206 | ic-data | [ ] Valid / [ ] Invalid | |
| 10.27.101.245 | Keystone-DB-02 | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 1521 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.5 | netflow testing  (till 31MAY2026) | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 3389 (TCP)
**Total Internal Hosts providing this service:** 9

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.54 | VEEAM-11-03 | [ ] Valid / [ ] Invalid | |
| 10.27.101.63 | VEEAM-11-04 | [ ] Valid / [ ] Invalid | |
| 10.27.101.76 | VEEAM-Backup-11 | [ ] Valid / [ ] Invalid | |
| 10.27.101.85 | VEEAM-11-02 | [ ] Valid / [ ] Invalid | |
| 10.27.101.102 | muic.ad.muic.io | [ ] Valid / [ ] Invalid | |
| 10.27.101.133 | Cloud-sync.muic.io | [ ] Valid / [ ] Invalid | |
| 10.27.101.213 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.244 | Keystone-DB-01 | [ ] Valid / [ ] Invalid | |
| 10.27.101.245 | Keystone-DB-02 | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 8000 (TCP)
**Total Internal Hosts providing this service:** 2

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.26 | netbox | [ ] Valid / [ ] Invalid | |
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 8002 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 8080 (TCP)
**Total Internal Hosts providing this service:** 5

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.25 | Net-NPS-200 (unifi-controller) | [ ] Valid / [ ] Invalid | |
| 10.27.101.77 | ubu-poc (Legacy-App-03) | [ ] Valid / [ ] Invalid | |
| 10.27.101.88 | QNAP-16 | [ ] Valid / [ ] Invalid | |
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.166 | Web-Dspace-126 Rev03 | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 8081 (TCP)
**Total Internal Hosts providing this service:** 2

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.18 | Web-Lib WP (libwp) | [ ] Valid / [ ] Invalid | |
| 10.27.101.46 | Airflow | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 8443 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.25 | Net-NPS-200 (unifi-controller) | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 8888 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 9000 (TCP)
**Total Internal Hosts providing this service:** 2

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.32 | Graylog | [ ] Valid / [ ] Invalid | |
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 9200 (TCP)
**Total Internal Hosts providing this service:** 1

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |

---

## 🌐 Port 10051 (TCP)
**Total Internal Hosts providing this service:** 2

| Internal Target IP | Hostname | Decision | Remark |
|--------------------|----------|----------|--------|
| 10.27.101.108 |  | [ ] Valid / [ ] Invalid | |
| 10.27.101.167 | Zabbix | [ ] Valid / [ ] Invalid | |

---

