import requests
import json
import csv
import time
from datetime import datetime, timezone

# ตั้งค่าการเชื่อมต่อ
url = "http://10.27.100.209:5080/api/default/_search"
auth = ("netadm@infra.muic.io", "EZYNTn5Xc73eAmV8LFbXtqfDkv9XuNhkvb9rsj0xrxY")

# SQL Query ดึงข้อมูล Group By (เฉพาะ TCP)
query_sql = (
    "SELECT "
    "    src_addr, "
    "    dst_addr, "
    "    dst_port, "
    "    proto, "
    "    MAX(_timestamp) as last_seen, "
    "    count(*) as total_flows, "
    "    SUM(bytes) / 1024 / 1024 / 1024 as total_gb "
    "FROM netflow "
    "WHERE dst_addr LIKE '10.27.101.%' "
    "  AND src_addr NOT LIKE '10.27.101.%' "
    "  AND LOWER(proto) = 'tcp' "
    "GROUP BY src_addr, dst_addr, dst_port, proto "
    "LIMIT 100000"
)

# ตั้งค่าช่วงวันที่
# เริ่มต้น: 4 พฤษภาคม 2569 (ค.ศ. 2026) 00:00:00 UTC
start_dt = datetime(2026, 5, 4, 0, 0, 0, tzinfo=timezone.utc)
# สิ้นสุด: ปัจจุบัน
end_dt = datetime.now(tz=timezone.utc)

start_time_total = int(start_dt.timestamp() * 1_000_000)
end_time_total   = int(end_dt.timestamp()   * 1_000_000)

# แบ่ง Chunk ทีละ 6 ชั่วโมง
chunk_hours  = 6
chunk_micros = chunk_hours * 60 * 60 * 1_000_000

# คำนวณจำนวนรอบ (ceiling division)
total_duration_hours = (end_time_total - start_time_total) // (60 * 60 * 1_000_000)
total_chunks = -(-total_duration_hours // chunk_hours)

# Dictionary สำหรับ Merge ข้อมูล (ป้องกันซ้ำ)
aggregated_data = {}

print(f"ช่วงเวลา: {start_dt.strftime('%d %b %Y')} -> {end_dt.strftime('%d %b %Y %H:%M')} UTC")
print(f"กำลังดึงข้อมูลแบ่งเป็น {total_chunks} รอบ (รอบละ {chunk_hours} ชั่วโมง)...")
print("-" * 65)

current_start = start_time_total

for i in range(total_chunks):
    current_end = current_start + chunk_micros
    if current_end > end_time_total:
        current_end = end_time_total

    chunk_start_str = datetime.fromtimestamp(current_start / 1_000_000).strftime('%d %b %Y %H:%M')
    chunk_end_str   = datetime.fromtimestamp(current_end   / 1_000_000).strftime('%d %b %Y %H:%M')

    payload = {
        "query": {
            "sql": query_sql,
            "start_time": current_start,
            "end_time":   current_end
        }
    }

    print(f"รอบที่ {i+1:2d}/{total_chunks} | {chunk_start_str} -> {chunk_end_str} ...", end=" ", flush=True)
    try:
        response = requests.post(url, auth=auth, json=payload, timeout=120)
        if response.status_code == 200:
            hits = response.json().get("hits", [])
            print(f"ได้รับ {len(hits):,} รูปแบบ")

            for hit in hits:
                key = (hit.get('src_addr'), hit.get('dst_addr'), hit.get('dst_port'), hit.get('proto'))
                if key not in aggregated_data:
                    aggregated_data[key] = hit.copy()
                else:
                    existing = aggregated_data[key]
                    existing['total_flows'] = existing.get('total_flows', 0) + hit.get('total_flows', 0)
                    existing['total_gb']    = existing.get('total_gb', 0)    + hit.get('total_gb', 0)
                    existing['last_seen']   = max(existing.get('last_seen', 0), hit.get('last_seen', 0))
        else:
            print(f"Error: HTTP {response.status_code}")
    except requests.exceptions.Timeout:
        print("Timeout! ข้ามรอบนี้ไป")
    except Exception as e:
        print(f"Error: {e}")

    current_start = current_end
    if current_start >= end_time_total:
        break

# ---- บันทึก JSON ----
final_hits = list(aggregated_data.values())
json_file  = "notlike101_traffic_may4_now.json"
with open(json_file, "w", encoding="utf-8") as f:
    json.dump({"hits": final_hits}, f, ensure_ascii=False, indent=4)

print("-" * 65)
print(f"สำเร็จ! รวมข้อมูลได้ {len(final_hits):,} รูปแบบ -> บันทึกเป็น '{json_file}'")

# ---- แปลงเป็น CSV (เปิดด้วย Excel ได้เลย) ----
csv_file = "notlike101_traffic_may4_now.csv"
with open(csv_file, "w", encoding="utf-8-sig", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["Last Seen", "Source IP", "Destination IP", "Destination Port", "Protocol", "Total Flows", "Total GB"])
    for hit in final_hits:
        ls = hit.get("last_seen")
        last_seen_str = datetime.fromtimestamp(ls / 1_000_000).strftime("%Y-%m-%d %H:%M:%S") if ls else "-"
        writer.writerow([
            last_seen_str,
            hit.get("src_addr", "-"),
            hit.get("dst_addr", "-"),
            hit.get("dst_port", "-"),
            hit.get("proto", "-"),
            hit.get("total_flows", 0),
            hit.get("total_gb", 0)
        ])

print(f"แปลง CSV สำเร็จ! -> บันทึกเป็น '{csv_file}' (เปิดด้วย Excel ได้เลยครับ)")
