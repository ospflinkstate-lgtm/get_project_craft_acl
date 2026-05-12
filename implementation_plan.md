# ACL Design Consultation & Implementation Plan
# สำหรับ Network Zone: 10.27.101.0/24 (Zero-Trust Inbound ACL)

---

## 🎯 เป้าหมาย (Objective)
สร้าง **Inbound ACL** เพื่อกำหนดว่า Source Network ใดสามารถเข้าถึง Destination Host ในวง `10.27.101.0/24` ได้บ้าง โดย **Default = DENY ALL** (Zero-Trust)

---

## ❓ คำตอบ 4 ข้อที่ปรึกษา

### 1. 🔢 ใส่ Port Number หรือ Protocol Name?

**คำแนะนำ: ใส่ทั้งคู่** — ตัวเลข Port พร้อม Comment ชื่อ Protocol

```
! ALLOW HTTPS (443) from Internet to Web Server
permit tcp any host 10.27.101.47 eq 443
```

**เหตุผล:**
- Cisco ACL ใช้ `eq 443` ไม่ใช่ `eq https` เพราะ Cisco IOS บางรุ่นไม่รู้จักชื่อทุกตัว
- Named protocol เช่น `eq www` (80), `eq domain` (53) ใช้ได้บางตัว แต่ไม่ครอบคลุม
- การใส่ตัวเลขมาตรฐาน RFC เป็น Best Practice ที่ทุก Platform รองรับ
- ใส่ `! remark` หรือ Comment กำกับไว้แทน เพื่อให้ Network Engineer อ่านเข้าใจง่าย

---

### 2. 📦 ควร Group Port เป็น Range หรือเปล่า?

**คำแนะนำ: แยกตาม Logic ไม่ใช่ตาม Range ตัวเลข**

| สถานการณ์ | วิธีที่ดี |
|---|---|
| Port ที่ใกล้กันและ Logic เดียวกัน | ใช้ `range 8080 8090` |
| Port ที่ไม่เกี่ยวกัน (เช่น 22, 80, 443) | **แยกบรรทัด** ดีกว่า — ชัดเจนและ audit ง่าย |
| Ephemeral Port (1024-65535) | ใช้ `gt 1024` หรือ `range 1024 65535` |

**⚠️ อย่า Group Port ต่างหน้าที่เข้าด้วยกัน** เช่น range 22-443 จะ allow port 23 (Telnet) และ port 80 (HTTP) โดยไม่ตั้งใจ → Security Risk

---

### 3. 🏢 src_addr ใน Subnet เดียวกัน → ALLOW เป็น Subnet?

**คำแนะนำ: ใช้ Subnet Summarization แต่ต้องพิจารณา Context**

จากข้อมูล `subnetwork.xlsx` ที่คุณมี:

| Source Subnet | Description | คำแนะนำ |
|---|---|---|
| `10.27.120.0/22` | WiFi-Client1 (VLAN320) | ALLOW เป็น subnet (ผู้ใช้ภายใน) |
| `10.27.109.0/24` | AP (VLAN109) | Allow เฉพาะ Port ที่จำเป็น |
| `10.27.4.0/24` | Internal (VLAN4) | Allow เป็น subnet (Staff) |
| `0.0.0.0/0` (Internet) | External | Allow เฉพาะ host ที่รู้จัก หรือ specific port เท่านั้น |

**กฎในการตัดสิน:**
- ถ้า `src_addr` ทุก IP ใน /24 เดียวกันเข้า Port เดิม → Summarize เป็น Subnet
- ถ้ามีแค่ 1-3 IP ใน subnet → ระบุ Host ตรงๆ ดีกว่า
- IP จาก Internet (Public IP) → **ห้าม Summarize** ให้ระบุ Host หรือ Prefix ที่ชัดเจน

---

### 4. 💬 ควรมี Remark/Comment ชื่อ Host ใน .101 ไหม?

**คำแนะนำ: YES — จำเป็นมากสำหรับ Professional ACL**

```
! ====================================================
! DESTINATION: 10.27.101.47 [cc-main] (Virtual Machine)
! ====================================================
! ALLOW HTTPS from Internet
permit tcp any host 10.27.101.47 eq 443
! ALLOW HTTP from Internet (redirect to HTTPS)  
permit tcp any host 10.27.101.47 eq 80
! DENY all other traffic to this host (implicit)
```

**เหตุผล:**
- Network Engineer ที่ Review จะเข้าใจ Context ทันที
- ช่วย Audit และ Troubleshoot เมื่อเวลาผ่านไป
- เป็น Best Practice ตาม NIST SP 800-41 และ CIS Benchmarks

---

## 🏗️ แผนการสร้างไฟล์ใหม่: `acl_professional.html`

### ฟีเจอร์ที่จะสร้าง

#### Panel ซ้าย: Traffic Flow Analyzer
- โหลด JSON (drag & drop หรือ fetch)
- กรองตาม Destination Host (10.27.101.x)
- แสดง Host Name + Type จาก `sub101.xlsx`
- แสดง Source Subnet (จาก `subnetwork.xlsx`)
- Checkbox เลือก Flow
- ปุ่ม "Select All Matched" (ไม่จำกัด 200 แถว)

#### Panel กลาง: Smart ACL Preview
- Auto-group Source IP เป็น Subnet ถ้าหลาย IP มาจาก /24 เดียวกัน
- แสดง Remark ชื่อ Host อัตโนมัติจาก sub101.xlsx
- Highlight Port ที่เป็น Well-known (สีต่างกัน)
- Format: **Cisco IOS ACL** เป็น Default (professional)

#### Panel ขวา: Summary & Export
- สรุปจำนวน Rules
- กลุ่ม Source: Internal / WiFi / Server / Internet
- ปุ่ม Copy & Download เป็น `.txt`
- ปุ่ม Export เป็น Cisco-ready format

### โครงสร้าง ACL ที่จะ Generate

```
! ============================================================
! ACL: PERMIT_TO_101_ZONE
! Generated: 2026-05-07  |  Policy: Zero-Trust / Least Privilege
! Reviewed by: [Network Engineer]
! ============================================================

! --- DESTINATION: 10.27.101.47 | cc-main (Virtual Machine) ---
remark ALLOW HTTPS from Internet to cc-main
permit tcp any host 10.27.101.47 eq 443
remark ALLOW HTTP from Internet to cc-main  
permit tcp any host 10.27.101.47 eq 80

! --- DESTINATION: 10.27.101.102 | [Unknown Host] ---
remark ALLOW LDAP from Internal Network 10.27.120.0/22
permit tcp 10.27.120.0 0.0.3.255 host 10.27.101.102 eq 389

! --- IMPLICIT DENY (MUST be last rule) ---
deny ip any any log
```

---

## 📋 Data Context จาก Files ที่วิเคราะห์

### Hosts ใน 10.27.101.0/24 (Notable)
| IP | Hostname | Type |
|---|---|---|
| 10.27.101.1 | cc-main | VM - Ubuntu |
| 10.27.101.3 | waf-oasis | VM - Ubuntu (WAF) |
| 10.27.101.9 | web-portal | VM - Ubuntu |
| 10.27.101.10 | QNAP-20 | NAS |
| 10.27.101.11 | teedy-app | VM - Ubuntu |
| 10.27.101.13 | WAF-pconline | VM - Ubuntu (WAF) |
| 10.27.101.18 | Web-Lib WP | VM - Ubuntu |
| 10.27.101.20 | Multi-01 (Guacamole) | VM - Ubuntu |
| 10.27.101.24 | packetfence | VM - Debian |
| 10.27.101.25 | Net-NPS-200 (unifi) | VM |
| 10.27.101.26 | netbox | VM - Ubuntu |
| 10.27.101.27 | IC-Payment-v2 | VM - Ubuntu |
| 10.27.101.32 | (Logstash target port 5044) | — |
| 10.27.101.47 | (Heavy traffic - Web Server) | — |
| 10.27.101.199-201 | DELL ESXi Hosts | Physical Server |
| 10.27.101.218 | sky-ad (AD Controller) | Windows Server 2022 |
| 10.27.101.230,240 | DELL ESXi Hypervisors | Physical Server |
| 10.27.101.247 | mail-relay | VM - Ubuntu |
| 10.27.101.254 | Default Gateway | — |

### Source Subnets ที่พบใน Traffic
| Network | VLAN | Description |
|---|---|---|
| 10.27.120.0/22 | 320 | WiFi-Client1 (Internal Users) |
| 10.27.109.0/24 | 109 | AP Network |
| 10.27.4.0/24 | 4 | Internal Network |
| 10.27.100.0/24 | 22 | Server Network |
| Public IPs | — | Internet (External) |

---

## 📈 Phase 2: Traffic Analysis & Smart Identification (In Progress)

### กิจกรรมปัจจุบัน
นำไฟล์ `notlike101_traffic_combined.json` (287MB) มาวิเคราะห์เชิงลึกเพื่อระบุว่า IP ภายนอกที่เข้ามาหาหน้าด่าน .101 คือใครบ้าง เพื่อความแม่นยำในการตั้งค่า ACL

### สิ่งที่ดำเนินการแล้ว
1. **Initial Analysis:** สร้างสคริปต์ `analyze_incoming_101.py` เพื่อกรองเฉพาะทราฟฟิกขาเข้าวง .101
2. **IP Categorization:** เพิ่มระบบแยกแยะประเภท IP เบื้องต้น (Internal vs External/CDN)
3. **Sorting Logic:** เรียงลำดับความสำคัญตาม "ประเภท IP" ก่อน แล้วตามด้วย "จำนวน Hits" เพื่อหาตัวที่น่าสงสัยหรือสำคัญที่สุด

### สิ่งที่กำลังดำเนินการ (Next Step)
- [ ] **Reverse DNS Lookup:** ทำการดึงชื่อ Domain จริงของ IP 50 อันดับแรก เพื่อระบุเจ้าของ (เช่น Google, Akamai, ISP Local Nodes)
- [ ] **Enriching Summary:** เพิ่มข้อมูล Domain เข้าไปในไฟล์สรุป `incoming_101_summary.json`
- [ ] **Integration:** เตรียมนำข้อมูลชื่อ Domain เหล่านี้ไปแสดงผลใน `acl_builder.html` เพื่อให้ Engineer ตัดสินใจ "Permit" หรือ "Deny" ได้ง่ายขึ้น

### ตัวอย่างกลุ่ม IP ที่พบ (Top Talkers)
- **Cloudflare:** พบหลายวง IP เช่น `172.67.x.x` และ `104.26.x.x`
- **AWS:** พบวง `52.187.x.x`
- **Unknown High Traffic:** IP `192.100.77.186` (อยู่ระหว่างตรวจสอบ Domain)

---

> **หมายเหตุ:** ข้อมูลจาก Phase นี้จะถูกนำไปใช้เป็น "ฐานข้อมูลอ้างอิง" ในการสร้าง ACL ที่ฉลาดขึ้นในอนาคตครับ
