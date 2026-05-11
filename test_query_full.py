import requests
import json
import time

# ตั้งค่าการเชื่อมต่อ
url = "http://10.27.100.209:5080/api/default/_search"
auth = ("netadm@infra.muic.io", "EZYNTn5Xc73eAmV8LFbXtqfDkv9XuNhkvb9rsj0xrxY")

# SQL Query ดึงข้อมูล Group By
query_sql = (
    "SELECT "
    "    src_addr, "
    "    dst_addr, "
    "    dst_port, "
    "    proto, "
    "    count(*) as total_flows, "
    "    SUM(bytes) / 1024 / 1024 / 1024 as total_gb "
    "FROM netflow "
    "WHERE dst_addr LIKE '10.27.101.%' "
    "  AND src_addr NOT LIKE '10.27.101.%' "
    "GROUP BY src_addr, dst_addr, dst_port, proto "
    "ORDER BY total_gb DESC " # เรียงตามจำนวนข้อมูลสูงสุด
    "LIMIT 1000" # ป้องกันข้อมูลล้น
)

# คำนวณเวลา (ไมโครวินาที) ย้อนหลัง 3 วัน
end_time = int(time.time() * 1_000_000)
start_time = end_time - (3 * 24 * 60 * 60 * 1_000_000) # ย้อนหลัง 3 วัน (วัน * ชม * นาที * วินาที * ไมโครวิ)

payload = {
    "query": {
        "sql": query_sql,
        "start_time": start_time,
        "end_time": end_time
    }
}

try:
    print("กำลังส่งคำขอไปยัง OpenObserve (ย้อนหลัง 3 วัน)... อาจใช้เวลาสักครู่")
    # ตั้ง timeout ไว้ 5 นาที เผื่อเซิร์ฟเวอร์ประมวลผลช้า (เนื่องจากดึง 3 วัน)
    response = requests.post(url, auth=auth, json=payload, timeout=300)

    if response.status_code == 200:
        data = response.json()
        with open("network_traffic_full.json", "w", encoding="utf-8") as f:
            json.dump(data, f, indent=4)
        print("สำเร็จ! บันทึกข้อมูลลงไฟล์ network_traffic_full.json แล้ว")
    else:
        print(f"เกิดข้อผิดพลาด: {response.status_code}")
        print(response.text)
except Exception as e:
    print(f"การเชื่อมต่อมีปัญหา: {e}")
