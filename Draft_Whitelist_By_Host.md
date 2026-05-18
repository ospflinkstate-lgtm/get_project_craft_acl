# 🛡️ Draft Whitelist ACL (By Host)
> **มุมมองที่ 1:** ตรวจสอบว่าแต่ละ Host (Server) มีพอร์ตอะไรเข้ามาบ้าง และเราควรอนุญาตพอร์ตเหล่านี้ตามหน้าที่ของมันหรือไม่

## 🖥️ 10.27.101.1 (cc-main)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 3 IPs | 137 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1440 IPs | 722,417 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 15083 IPs | 1,231,314 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 48 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.2 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 336 IPs | 1,182 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 380 IPs | 1,230 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 76 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.3 (waf-oasis)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 1123 IPs | 12,621 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1134 IPs | 13,247 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 95 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.4 (netflow testing (till 31MAY2026))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 367 IPs | 1,738 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 389 IPs | 1,566 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 123 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.5 (netflow testing  (till 31MAY2026))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 12 IPs | 40 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 14 IPs | 29 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 21 | [ ] Allow / [ ] Deny | |
| Port 1521 | TCP | 1 IPs | 7 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.6 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 74 IPs | 632 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 81 IPs | 3,959 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 3 IPs | 610 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.7 (netflow testing  (till 31MAY2026))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 68 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.8 (netflow testing  (till 31MAY2026))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 72 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.9 (web-portal)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 2 IPs | 55 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1513 IPs | 29,769 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1893 IPs | 69,792 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 117 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.10 (QNAP-20)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 111 | TCP | 1 IPs | 24 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1 IPs | 1,470 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 12 IPs | 65,551 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.11 (teedy-app)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 93 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.13 (WAF - pconline)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 1661 IPs | 29,525 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 3100 IPs | 101,610 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 91 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.18 (Web-Lib WP (libwp))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 92 | [ ] Allow / [ ] Deny | |
| Port 8081 | TCP | 3 IPs | 84 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.20 (Multi-01 (APACHE GUACAMOLE))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 2 IPs | 883 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 45 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.21 (TestLabs-21-101-200)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 3 IPs | 511 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 54 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.22 (Test-App-02 (os.muic.io))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 3 IPs | 309 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.23 (Test-App-03 (teedy))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 24 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 50 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.24 (packetfence)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 69 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.25 (Net-NPS-200 (unifi-controller))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 2 IPs | 56 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1 IPs | 2 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |
| Port 8080 | TCP | 1 IPs | 2 | [ ] Allow / [ ] Deny | |
| Port 8443 | TCP | 7 IPs | 1,537 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.26 (netbox)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |
| Port 8000 | TCP | 1 IPs | 69 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.27 (IC-Payment-v2)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 2 IPs | 42 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1040 IPs | 7,582 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 841 IPs | 6,280 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 56 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.28 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 110 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.29 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 65 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.32 (Graylog)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 96 | [ ] Allow / [ ] Deny | |
| Port 9000 | TCP | 3 IPs | 298,388 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.34 (keycloak-200-1)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 8 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 90 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.35 (minio)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 3 IPs | 92 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 71 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.38 (ED-WP (ed-wp))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 79 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1034 IPs | 7,379 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1763 IPs | 27,104 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 77 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.40 (DB-IC-199 (db-0))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 74 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.41 (waf-wiki)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 1913 IPs | 25,085 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1482 IPs | 30,035 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 98 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.45 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 73 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.46 (Airflow)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 1,486 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 59 | [ ] Allow / [ ] Deny | |
| Port 8081 | TCP | 1 IPs | 205 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.47 (EDX-App-251)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 2622 IPs | 117,352,570 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 4796 IPs | 24,574,051 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 95 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.50 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 105 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.52 (ic-db-200)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 15 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 69 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.53 (waf-poc)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 362 IPs | 1,778 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 386 IPs | 1,684 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 98 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.54 (VEEAM-11-03)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 96 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 1 IPs | 751 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.55 (QNAP-01)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 139 | TCP | 2 IPs | 12 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 3 IPs | 102 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.57 (QNAP-06)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 1 IPs | 17 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 32 IPs | 6,008 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.58 (QNAP-07)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 111 | TCP | 1 IPs | 50 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1 IPs | 30 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 102 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.60 (QNAP-09-Lib)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 1 IPs | 3,060 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 11 IPs | 48,856 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.61 (legacy-nfs)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 98 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.63 (VEEAM-11-04)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 98 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 1 IPs | 82 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.64 (QNAP-10)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 111 | TCP | 2 IPs | 27 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1 IPs | 1,899 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 3 IPs | 2,689 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.66 (waf-lib)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 1396 IPs | 14,979 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 2656 IPs | 29,003 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 94 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.68 (QNAP-13)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 34 IPs | 37,953 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.70 (QNAP-14)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 1 IPs | 1,087 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 50 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.71 (kong-api)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 2 IPs | 78 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 72 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.76 (VEEAM-Backup-11)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 51 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 1 IPs | 2,449 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.77 (ubu-poc (Legacy-App-03))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 156 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1 IPs | 52 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 98 | [ ] Allow / [ ] Deny | |
| Port 8080 | TCP | 2 IPs | 207 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.80 (QNAP-15)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 1 IPs | 805 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 51 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.83 (Sci-Div-01v2 (cs.muic.mahidol.ac.th))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 7 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 844 IPs | 5,439 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 30343 IPs | 103,335 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 45 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.85 (VEEAM-11-02)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 95 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 1 IPs | 534 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.87 (Kong-Legacy-199 (Routing))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 12 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1 IPs | 4 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 8 IPs | 3,003 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 65 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.88 (QNAP-16)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 139 | TCP | 1 IPs | 14 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 30 IPs | 26,666 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 2 IPs | 40,837 | [ ] Allow / [ ] Deny | |
| Port 8080 | TCP | 1 IPs | 1,232 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.89 (HR Plus)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 1 IPs | 72 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 91 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.90 (QNAP-17)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 2 IPs | 10 | [ ] Allow / [ ] Deny | |
| Port 111 | TCP | 1 IPs | 26 | [ ] Allow / [ ] Deny | |
| Port 139 | TCP | 5 IPs | 10 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1 IPs | 34 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 131 IPs | 482,566 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.91 (it-helpdesk)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 832 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1 IPs | 22 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 92 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.93 (dspace)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 92 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.98 (muproxy-243)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 23 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1102 IPs | 8,025 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 2355 IPs | 24,156 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 70 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.102 (muic.ad.muic.io)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 88 | TCP | 22 IPs | 2,040 | [ ] Allow / [ ] Deny | |
| Port 135 | TCP | 6 IPs | 3,201 | [ ] Allow / [ ] Deny | |
| Port 389 | TCP | 9 IPs | 86,544 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 7 IPs | 17,989 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 2 IPs | 90 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.106 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 85 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.108 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 76 | [ ] Allow / [ ] Deny | |
| Port 1024 | TCP | 2 IPs | 4 | [ ] Allow / [ ] Deny | |
| Port 8000 | TCP | 1 IPs | 2 | [ ] Allow / [ ] Deny | |
| Port 8002 | TCP | 1 IPs | 2 | [ ] Allow / [ ] Deny | |
| Port 8080 | TCP | 1 IPs | 2 | [ ] Allow / [ ] Deny | |
| Port 8888 | TCP | 3 IPs | 5 | [ ] Allow / [ ] Deny | |
| Port 9000 | TCP | 1 IPs | 2 | [ ] Allow / [ ] Deny | |
| Port 9200 | TCP | 1 IPs | 2 | [ ] Allow / [ ] Deny | |
| Port 10051 | TCP | 3 IPs | 6 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.113 (apisix-demo)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 66 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.114 (swarm-234)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 2 IPs | 24 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 50 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.115 (swarm-243)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 14 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 42 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.116 (swarm-200)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 2 IPs | 38 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 48 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.117 (swarm-199)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 3 IPs | 144 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 45 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.118 (ic-elearning)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 82 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.126 (HP Proliant DL380G7)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 1 IPs | 207 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 119 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.132 (k8s control)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 44 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.133 (Cloud-sync.muic.io)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 74 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 1 IPs | 46 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.134 (HP Proliant DL560 Gen 8 (SKY))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 1 IPs | 133 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 105 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.135 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 81 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.141 (k3s-node-01)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.142 (k3s-node-02 (node-02))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 93 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.143 (k3s-node-03)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.144 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 114 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.149 (DELL PowerEdge R610)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 105 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.150 (WinDBTStart-01-134)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 116 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.153 (keycloak-199)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 2 IPs | 128 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 89 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.154 (Wifi-DNSMASQ)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 3 IPs | 140 | [ ] Allow / [ ] Deny | |
| Port 53 | TCP | 134 IPs | 416,930 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1 IPs | 6 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 91 | [ ] Allow / [ ] Deny | |
| Port 853 | TCP | 200 IPs | 10,438 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.165 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 115 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.166 (Web-Dspace-126 Rev03)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 91 | [ ] Allow / [ ] Deny | |
| Port 8080 | TCP | 5 IPs | 205 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.167 (Zabbix)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 6 IPs | 52,001 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 1 IPs | 6 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |
| Port 10051 | TCP | 1 IPs | 242,554 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.194 (Ubuntu-Prometheus)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 63 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.197 (Ubuntu-For Testing)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 68 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.199 (DELL PowerEdge R750)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 3 IPs | 3,884 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 59 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.200 (DELL PowerEdge R750)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 4 IPs | 1,944 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 56 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.201 (DELL PowerEdge R610)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 57 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.203 (k3s-Control)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 4 IPs | 271 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 43 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.205 (DELL PowerEdge R610)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 9 IPs | 2,551 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.206 (ic-data)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 100 | [ ] Allow / [ ] Deny | |
| Port 1433 | TCP | 10 IPs | 13,824 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.207 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 45 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.209 (GLPI)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 2 IPs | 46 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 71 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.210 (sky-Grad-Portal)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 24 | [ ] Allow / [ ] Deny | |
| Port 80 | TCP | 1 IPs | 60 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.211 (Wazuh-munet)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 3 IPs | 1,218 | [ ] Allow / [ ] Deny | |
| Port 443 | TCP | 10 IPs | 2,079 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 43 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.213 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 1 IPs | 24,049 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.216 (swarm-NFS-199 (web-enroll))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 68 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.221 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 101 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.222 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 107 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.224 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 90 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.225 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 80 | TCP | 1 IPs | 1,496 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 94 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.229 ()
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 109 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.230 (DELL PowerEdge 630)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 2 IPs | 1,613 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 110 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.232 (KeystoneApp-Prod-01 (kapp01))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 19 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 41 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.234 (DELL PowerEdge 640 (SKY+))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 3 IPs | 2,834 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 66 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.235 (KeystoneApp-UAT)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 48 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.236 (ks-nfs)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 22 | TCP | 1 IPs | 87 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 74 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.240 (DELL PowerEdge 630)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 2 IPs | 1,286 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 110 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.243 (DELL PowerEdge 640 (SKY+))
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 2 IPs | 2,114 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 65 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.244 (Keystone-DB-01)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 49 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 1 IPs | 89 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.245 (Keystone-DB-02)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 73 | [ ] Allow / [ ] Deny | |
| Port 1433 | TCP | 3 IPs | 1,135 | [ ] Allow / [ ] Deny | |
| Port 3389 | TCP | 2 IPs | 207 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.247 (mail-relay)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 25 | TCP | 32 IPs | 1,263 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 110 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.248 (mail-relay-ED-200)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 445 | TCP | 1 IPs | 103 | [ ] Allow / [ ] Deny | |

---

## 🖥️ 10.27.101.251 (DELL PowerEdge R610)
| Destination Port | Protocol | Sources Count | Flows | Decision | Remark |
|------------------|----------|---------------|-------|----------|--------|
| Port 443 | TCP | 1 IPs | 1,214 | [ ] Allow / [ ] Deny | |
| Port 445 | TCP | 1 IPs | 113 | [ ] Allow / [ ] Deny | |

---

