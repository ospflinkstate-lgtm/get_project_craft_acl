import csv
import json
import os

host_map = {}

# Parse sub101.csv
if os.path.exists('sub101.csv'):
    with open('sub101.csv', 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        for row in reader:
            ip = row.get('IP', '').strip()
            if not ip: continue
            
            # Map columns to match existing json structure + new columns
            host_map[ip] = {
                "name": row.get('Host name', '').strip(),
                "type": row.get('Type', '').strip(),
                "Guest OS": row.get('Guest OS', '').strip(),
                "Physical Host IP": row.get('Physical Host IP', '').strip()
            }

# Parse subnetwork.csv
if os.path.exists('subnetwork.csv'):
    with open('subnetwork.csv', 'r', encoding='utf-8-sig') as f:
        # subnetwork.csv has headers on line 3, so skip first 2 lines
        next(f)
        next(f)
        reader = csv.DictReader(f)
        for row in reader:
            network = row.get('Network', '').strip()
            mark = row.get('Mark', '').strip()
            if not network or network == '-': continue
            
            subnet_key = f"{network}{mark}"
            desc = row.get('Int.Descriptions MUIT', '').strip()
            if not desc:
                desc = row.get('Host', '').strip() # Fallback to Host column if description is empty
                
            host_map[subnet_key] = {
                "name": desc,
                "type": "Subnet",
                "VLAN ID": row.get('VLAN ID', '').strip(),
                "IP Gateway": row.get('IP Gateway', '').strip(),
                "IP Range": row.get('IP Range', '').strip()
            }

# Write output keeping existing filename
with open('host_map.json', 'w', encoding='utf-8') as f:
    json.dump(host_map, f, indent=2, ensure_ascii=False)
    
print("Successfully extracted sub101.csv and subnetwork.csv into host_map.json")
