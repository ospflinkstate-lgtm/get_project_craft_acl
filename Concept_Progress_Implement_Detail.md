# 📚 Master Knowledge Base: Network Automation & Git Operational Excellence
> **ฉบับสมบูรณ์ (Ultra-Detailed Summary + Deep Technical Implementation)**
> รวบรวมรายละเอียดทางเทคนิคเชิงลึก โค้ดที่ใช้จริง คำสั่ง และเหตุการณ์สำคัญจากกระบวนการพัฒนาทั้งหมด

---

## 🛰️ 1. เจาะลึก: OpenObserve Data Pipeline & Analysis
กระบวนการจัดการข้อมูล NetFlow ปริมาณมหาศาลเพื่อใช้ในงานวิศวกรรมเครือข่าย

### ⚙️ 1.1 เทคนิคการดึงข้อมูลและ API Interaction (Python)
*   **Query Batching (6-Hour Chunks):**
    *   **ปัญหา:** การดึงข้อมูลยาวต่อเนื่อง (เช่น 10 วัน) ทำให้ Server เกิด Error 500 หรือ Timeout เนื่องจากประมวลผลไม่ทัน
    *   **วิธีแก้:** สคริปต์ `notlike101_query_start27.py` ถูกออกแบบให้ดึงข้อมูลทีละ 6 ชั่วโมง (28 รอบ สำหรับวันที่ 27 เม.ย. - 3 พ.ค. 2026)
    *   **Time Logic (Microseconds):** OpenObserve API ต้องการเวลาในหน่วย Microseconds การเขียนโค้ด Python จึงใช้รูปแบบ:
        ```python
        end_time = int(datetime.now().timestamp() * 1_000_000)
        start_time = end_time - (6 * 60 * 60 * 1_000_000) # ย้อนหลัง 6 ชั่วโมง
        ```
*   **The Power of LIMIT:**
    *   OpenObserve มี Default Limit ที่ **1,000 แถว** ซึ่งไม่เพียงพอต่อปริมาณ Traffic
    *   ตั้งค่า `LIMIT 100000` ในคำสั่ง SQL เพื่อให้ครอบคลุม Flow ทั้งหมดในแต่ละ Chunk (จากการตรวจสอบพบว่าแต่ละ Chunk มีทราฟฟิกประมาณ 30k - 96k รายการ)

### 🐛 1.2 การแก้ไขบั๊ก Data Type Coercion (SQL)
*   **ปัญหาที่พบ:** เกิด Error `Cannot infer common argument type for comparison operation Int64 > Timestamp(ns)` 
*   **สาเหตุ:** เกิดจากการใช้เงื่อนไข `WHERE _timestamp > now() - interval '10 minute'` ใน SQL ของ OpenObserve ซึ่งมีการตีความ Data Type ผิดพลาด
*   **วิธีแก้:** ถอดเงื่อนไขเรื่องเวลาออกจาก `WHERE` clause ใน SQL และนำไปกำหนดในฟิลด์ `start_time` และ `end_time` ของ JSON Payload ที่ยิงเข้า API แทน ทำให้ API กรองข้อมูลได้ถูกต้องและเร็วกว่า

### 📊 1.3 การจัดการ Data Enrichment & Aggregation
*   **Aggregation Logic (`analyze_incoming_101.py`):** ยุบรวม (Aggregation) ข้อมูลที่มี Source, Destination, Port ตรงกัน เช่น จาก 1,000 แถว ให้เหลือ 1 แถว แล้วนำค่า `total_flows` มาบวกกัน
*   **Host Intelligence (`sub101.xlsx`):** ระบบจะอ่านค่า IP ในวง 10.27.101.x และดึงชื่อ Hostname มาใส่ใน `remark` ของ ACL อัตโนมัติ (เช่น `remark Allow to Mail Server`)
*   **Subnet Mapping (`subnetwork.xlsx`):** ระบุ VLAN และชื่อวงเครือข่ายต้นทาง
*   **Excel-Ready CSV:** ใช้ `utf-8-sig` (Byte Order Mark) ในการเซฟไฟล์ CSV เพื่อให้ Excel เปิดไฟล์ภาษาไทยได้โดยไม่เพี้ยน:
    ```python
    with open(output_file, 'w', encoding='utf-8-sig', newline='') as f:
    ```

---

## 💻 2. เจาะลึก: UI/UX & Specialized Dashboards (HTML/JS)
การสร้างเครื่องมือให้ตอบโจทย์ทั้งระดับวิศวกรและผู้บริหาร โดยไม่ใช้ Backend

### ⚡ 2.1 DOM Rendering Performance
*   **ปัญหาเบราว์เซอร์ค้าง:** การพยายามวาดตาราง (Render DOM Nodes) ข้อมูลจำนวน 400,000+ รายการพร้อมกันทำให้เบราว์เซอร์ (Chrome/Edge) ค้างทันที
*   **In-Memory Filtering & Top-N Rendering:**
    *   โหลดข้อมูลทั้งหมดเก็บไว้ในตัวแปร Array ของ JavaScript (Memory)
    *   เวลาผู้ใช้ค้นหา (Search/Filter) จะทำการประมวลผลใน Array ก่อน
    *   **เคล็ดลับ:** สั่งให้เบราว์เซอร์วาดตาราง (Render) เฉพาะ **100 - 200 รายการแรก** (Top-N) เท่านั้น ทำให้หน้าเว็บลื่นไหล 100%

### 🛠️ 2.2 Advanced ACL Builder (`acl_builder.html`)
*   **Select ALL Matched Feature:**
    *   เนื่องจากตารางแสดงแค่ 200 รายการ (จากข้อ 2.1) หากค้นหาแล้วเจอ 450 รายการ ผู้ใช้จะเลือกได้ไม่หมด
    *   การสร้างปุ่ม **"Select ALL Matched"** จะทำงานโดยไปดึงข้อมูลจาก Array ใน Memory ที่ตรงกับ Filter ทั้งหมด (ข้ามข้อจำกัดของตาราง) เพื่อนำไปสร้าง ACL ได้ครบถ้วนทันที
*   **Multi-Vendor Support:** 
    *   **Cisco IOS:** `access-list 101 permit tcp host ...`
    *   **MikroTik:** `/ip firewall filter add chain=forward action=accept ...`
    *   **pfSense:** `pass in quick on em0 proto tcp from ...`

### 👔 2.3 CORS Bypass & Drag-and-Drop
*   **ปัญหา CORS Policy:** เบราว์เซอร์มีระบบรักษาความปลอดภัย ห้ามไฟล์ HTML ที่เปิดผ่าน Local (`file:///`) ทำการ `fetch()` อ่านไฟล์ JSON ในเครื่องตัวเอง
*   **วิธีแก้ (Drag & Drop Architecture):** 
    *   ใช้ JavaScript `FileReader` API สร้างโซนให้ผู้ใช้ลากไฟล์ JSON มาวาง
    *   วิธีนี้เบราว์เซอร์จะอนุญาตให้อ่านข้อมูลได้เพราะถือเป็น "การกระทำโดยตั้งใจของผู้ใช้" (User-initiated action) ทำให้ไม่ต้องรัน Local Web Server (`python -m http.server`) อีกต่อไป

---

## 🌳 3. เจาะลึก: Git & DevOps Workflow (Security & Operations)
การแก้ปัญหาทางเทคนิคและสถาปัตยกรรม Git ใน Windows

### 🛡️ 3.1 กรณีศึกษา: System Path & Permission
*   **The System32 Incident:** ผู้ใช้เปิด PowerShell ในสิทธิ์ Admin ซึ่งค่าเริ่มต้นจะอยู่ที่ `C:\WINDOWS\System32` เมื่อพยายามสั่ง `git init` จึงเกิด "Permission Denied" หรือสร้างโฟลเดอร์ซ้อนในระบบ OS
*   **วิธีแก้:** ต้อง `cd` หรือเปิด Terminal ให้ตรงกับ Workspace (เช่น `E:\vibe_code\get_project_craft_acl`) ทุกครั้ง

### 🚨 3.2 กรณีศึกษา: Security Breach & Token Exposure
*   **The Token Incident:** เผลอ `git add .` และ `commit` ไฟล์ `Mygittoken.txt` ที่มี Personal Access Token (PAT) ลงไปในประวัติ
*   **กระบวนการแก้ไขขั้นเด็ดขาด (Rewrite History):**
    1. ยกเลิก Token ในหน้าเว็บ GitHub (Revoke) ทันที
    2. ใช้คำสั่ง `rm -rf .git` เพื่อทำลาย "สมองความจำ" ของ Git ในเครื่อง (ล้างประวัติทั้งหมด)
    3. สร้างไฟล์ `.gitignore` ก่อนเพื่อป้องกันไฟล์เดิม
    4. สั่ง `git init` และ Commit ใหม่แบบคลีนๆ
    5. สั่ง **Force Push** ทับขึ้นไปบน GitHub เพื่อบังคับให้ระบบลบประวัติที่เคยมี Token ทิ้ง:
       ```powershell
       git push -u origin main --force
       ```

### 🔑 3.3 กรณีศึกษา: Authentication Port Refused
*   **ปัญหา:** ตอนสั่ง `git push` ครั้งแรก ระบบพยายามเปิดหน้าเว็บล็อกอิน แต่เกิด Error `127.0.0.1 port 50524 refused to connect`
*   **สาเหตุ:** OAuth Flow ของ GitHub Desktop ไม่สามารถคุยกับ Local Port บนเครื่อง Windows บางเครื่องได้
*   **วิธีแก้:** ยกเลิกการล็อกอินผ่านเบราว์เซอร์ และเข้าไปสร้าง **Personal Access Token (Classic)** ใน GitHub Developer Settings เพื่อนำ Token ยาวๆ มาใส่เป็น Password ในหน้าต่าง Git Credential Manager แทน

---

## 🛡️ 4. เจาะลึก: ACL Design & Traffic Intelligence (จาก Implementation Plan)
หลักการออกแบบกฎ Firewall (Zero-Trust) แบบมืออาชีพและตรวจสอบได้ง่าย

### 📏 4.1 กฎการออกแบบ Port และ Protocol
*   **Port Number vs Name:** 
    *   **แนวทางปฏิบัติ:** ใช้ตัวเลข Port มาตรฐาน (เช่น `eq 443`) และใช้เครื่องหมาย `! remark` หรือ Comment เพื่อบอกชื่อบริการ (เช่น HTTPS) ควบคู่กันเสมอ
    *   **เหตุผล:** อุปกรณ์เครือข่ายบางรุ่นไม่รู้จักชื่อ Protocol ที่เป็นตัวหนังสือ การใส่ตัวเลขเป็นหลักประกันว่า ACL จะทำงานได้แน่นอน
*   **Port Grouping (การรวมกลุ่มพอร์ต):**
    *   ให้ใช้คำสั่ง `range` เฉพาะพอร์ตที่มีจุดประสงค์การทำงาน **กลุ่มเดียวกัน** เท่านั้น (เช่น `range 8080 8090` สำหรับ Web Service)
    *   **⚠️ ข้อควรระวัง (Security Risk):** **ห้าม** Group พอร์ตที่ทำงานต่างกันเข้าด้วยกัน (เช่น `range 22 443`) เพราะจะทำให้พอร์ตอันตรายที่อยู่ระหว่างกลางหลุดเข้าไปด้วย (เช่น พอร์ต 23 Telnet)
    *   **Ephemeral Ports:** สำหรับพอร์ตแบบสุ่มสูงๆ ให้ใช้ `gt 1024` หรือ `range 1024 65535`

### 🌐 4.2 กฎการยุบรวม Subnet (Summarization Logic)
การตัดสินใจว่าจะ Allow แบบระบุ IP ตรงๆ หรือจะเหมารวมทั้งวง Subnet
*   **Internal Subnet (เช่น 10.27.120.0/22):** หากพบว่า IP หลายตัวในวงเดียวกันเข้ามาใช้งาน Port เดียวกันเป็นประจำ ให้ตั้งเป็น **Allow Subnet** ได้เลยเพื่อลดความยาวของ ACL
*   **Specific Hosts:** หากมีแค่ 1-3 เครื่องในวงนั้นที่เข้ามาใช้งาน ให้ระบุเป็น Host (IP เดี่ยว) เพื่อความปลอดภัย (Least Privilege)
*   **Public IP (Internet):** **ห้าม Summarize เด็ดขาด** (`0.0.0.0/0`) ต้องระบุเจาะจง IP หรือจำกัดแค่ Port ที่จำเป็นที่สุด (เช่น อนุญาตให้โลกภายนอกเข้าแค่ 80, 443)

### 🔍 4.3 Network Classification & Enrichment
การแยกแยะแหล่งที่มาของทราฟฟิกเพื่อประกอบการทำ ACL
*   **Internal Network:** ทราฟฟิกในองค์กร เช่น `10.x.x.x`, `172.16.x.x`, `192.168.x.x`
*   **CDN & Cloud Detection:** 
    *   ใช้ข้อมูล **Reverse DNS Lookup** ในการระบุตัวตน IP สาธารณะ
    *   สามารถจัดกลุ่มผู้ให้บริการรายใหญ่ได้ เช่น **Cloudflare** (`172.67.x.x`, `104.26.x.x`) หรือ **AWS** (`52.187.x.x`) 
*   **Professional Format Rule:** การสร้างคำสั่ง Cisco ACL ต้องปิดท้ายด้วย `deny ip any any log` เสมอ เพื่อบังคับใช้นโยบาย Zero-Trust (หากไม่ตรงกับบรรทัดด้านบน ให้บล็อกและบันทึก Log ทันที)

---

## 🛠️ 5. สรุปคำสั่งสำคัญและเทคนิคเฉพาะทาง (Operational Cheat Sheet)

| หมวดหมู่ | คำสั่ง / เทคนิค | รายละเอียด |
| :--- | :--- | :--- |
| **Data** | `LIMIT 100000` | บังคับดึงข้อมูลให้ครบทุกรายการใน SQL |
| **Data** | `datetime.timestamp() * 1000000` | แปลงเวลา Python เป็น Microseconds |
| **JS** | `FileReader.readAsText()` | ทะลวงข้อจำกัด CORS เพื่ออ่านไฟล์ Local JSON |
| **Git** | `git log --oneline` | ตรวจสอบรหัสประวัติ (Commit ID) และความคลีนของประวัติ |
| **Git** | `git rm --cached <file>` | ถอดไฟล์ออกจากการติดตามของ Git (แต่ไฟล์ในเครื่องยังอยู่) |
| **Git** | `git push -u origin main --force` | บังคับเขียนทับประวัติศาสตร์บน GitHub (ใช้ตอนฉุกเฉิน) |
| **Terminal** | `winget install Git.Git` | คำสั่งติดตั้ง Git ผ่าน Windows Terminal อย่างรวดเร็ว |

---

> **📌 Remark สำคัญสำหรับการทำงานต่อ:**
> - ไฟล์หลักที่ควรใช้เป็นฐานข้อมูลในการ Draft ACL คือ **`notlike101_traffic_combined.json`** ซึ่งผ่านกระบวนการ Merge และ Aggregate (ยุบรวมทราฟฟิกที่ซ้ำกัน) แล้ว
> - สำหรับการนำเสนอผู้บริหาร แนะนำให้ใช้ไฟล์ **`executive_presentation.html`** และเปิดผ่านลิงก์ **GitHub Pages** เพื่อความสะดวกและเป็นมืออาชีพ โดยไม่ต้องเปิดจากเครื่อง Local
