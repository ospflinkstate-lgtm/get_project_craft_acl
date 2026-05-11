import json
import csv
from datetime import datetime

input_file = 'notlike101_traffic_full.json'
output_file = 'notlike101_traffic_full.csv'

print("กำลังอ่านไฟล์ JSON...")
try:
    with open(input_file, 'r', encoding='utf-8') as f:
        data = json.load(f)

    hits = data.get('hits', [])

    print(f"พบข้อมูล {len(hits)} รายการ กำลังเขียนลงไฟล์ Excel (CSV)...")

    # ใช้ utf-8-sig เพื่อบังคับใส่ BOM เข้าไป ทำให้ Excel อ่านภาษาไทยหรือ Format ได้ถูกต้องทันที
    with open(output_file, 'w', encoding='utf-8-sig', newline='') as f:
        writer = csv.writer(f)
        
        # เขียนหัวตาราง (Header)
        writer.writerow([
            'Last Seen',
            'Source IP',
            'Destination IP',
            'Destination Port',
            'Protocol',
            'Total Flows',
            'Total GB'
        ])
        
        # เขียนข้อมูลแต่ละแถว
        for hit in hits:
            # แปลงเวลา microseconds เป็น Date Time
            last_seen = hit.get('last_seen')
            if last_seen:
                dt = datetime.fromtimestamp(last_seen / 1_000_000)
                last_seen_str = dt.strftime('%Y-%m-%d %H:%M:%S')
            else:
                last_seen_str = '-'
                
            writer.writerow([
                last_seen_str,
                hit.get('src_addr', '-'),
                hit.get('dst_addr', '-'),
                hit.get('dst_port', '-'),
                hit.get('proto', '-'),
                hit.get('total_flows', 0),
                hit.get('total_gb', 0)
            ])

    print(f"เสร็จสิ้น! บันทึกไฟล์เป็น '{output_file}' แล้วครับ สามารถดับเบิลคลิกเปิดด้วย Excel ได้เลย")
    
except Exception as e:
    print(f"เกิดข้อผิดพลาด: {e}")
