import requests
import json

# ตั้งค่าการเชื่อมต่อ
url = "http://10.27.100.209:5080/api/default/_search"
auth = ("netadm@infra.muic.io", "EZYNTn5Xc73eAmV8LFbXtqfDkv9XuNhkvb9rsj0xrxY")

# SQL Query ดึงข้อมูล 10 นาทีล่าสุด เพื่อประหยัด RAM เซิร์ฟเวอร์
query_sql = (
    "SELECT src_addr, dst_addr, dst_port, proto, bytes "
    "FROM netflow "
    "WHERE _timestamp > now() - interval '1 minute' "
    "LIMIT 10"
)
payload = {"query": {"sql": query_sql}}

try:
    print("กำลังส่งคำขอไปยัง OpenObserve (10 นาทีล่าสุด)...")
    # ตั้ง timeout ไว้ 5 นาที เผื่อเซิร์ฟเวอร์ประมวลผลช้า
    response = requests.post(url, auth=auth, json=payload, timeout=300)

    if response.status_code == 200:
        data = response.json()
        with open("network_traffic_python.json", "w", encoding="utf-8") as f:
            json.dump(data, f, indent=4)
        print(f"สำเร็จ! บันทึกข้อมูลลงไฟล์ network_traffic_python.json แล้ว")
    else:
        print(f"เกิดข้อผิดพลาด: {response.status_code}")
        print(response.text)
except Exception as e:
    print(f"การเชื่อมต่อมีปัญหา: {e}")
    
    
    
    