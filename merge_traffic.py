import json
import os

def merge_traffic(file1, file2, output_file):
    print(f"Loading {file1}...")
    with open(file1, 'r') as f:
        data1 = json.load(f)
    
    print(f"Loading {file2}...")
    with open(file2, 'r') as f:
        data2 = json.load(f)

    merged = {}

    print("Merging data...")
    # Process first file
    for hit in data1.get('hits', []):
        key = (hit['src_addr'], hit['dst_addr'], hit['dst_port'], hit['proto'])
        merged[key] = {
            'src_addr': hit['src_addr'],
            'dst_addr': hit['dst_addr'],
            'dst_port': hit['dst_port'],
            'proto': hit['proto'],
            'total_flows': hit.get('total_flows', 0),
            'total_gb': hit.get('total_gb', 0),
            'last_seen': hit.get('last_seen', 0)
        }

    # Process second file
    for hit in data2.get('hits', []):
        key = (hit['src_addr'], hit['dst_addr'], hit['dst_port'], hit['proto'])
        if key in merged:
            merged[key]['total_flows'] += hit.get('total_flows', 0)
            merged[key]['total_gb'] += hit.get('total_gb', 0)
            merged[key]['last_seen'] = max(merged[key]['last_seen'], hit.get('last_seen', 0))
        else:
            merged[key] = {
                'src_addr': hit['src_addr'],
                'dst_addr': hit['dst_addr'],
                'dst_port': hit['dst_port'],
                'proto': hit['proto'],
                'total_flows': hit.get('total_flows', 0),
                'total_gb': hit.get('total_gb', 0),
                'last_seen': hit.get('last_seen', 0)
            }

    result = {
        'hits': list(merged.values())
    }

    print(f"Saving merged data to {output_file}...")
    with open(output_file, 'w') as f:
        json.dump(result, f, indent=4)
    
    print("Done!")

if __name__ == "__main__":
    # Ensure paths are absolute or relative to Cwd
    cwd = os.getcwd()
    f1 = os.path.join(cwd, 'notlike101_traffic_start27.json')
    f2 = os.path.join(cwd, 'notlike101_traffic_may4_now.json')
    out = os.path.join(cwd, 'notlike101_traffic_combined.json')
    
    if os.path.exists(f1) and os.path.exists(f2):
        merge_traffic(f1, f2, out)
    else:
        print("Error: One or both input files not found.")
