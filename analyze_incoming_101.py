import json
import os
import socket
from collections import defaultdict

# Set working directory to script location
os.chdir(os.path.dirname(os.path.abspath(__file__)))

def get_domain_name(ip):
    try:
        socket.setdefaulttimeout(0.8)
        return socket.gethostbyaddr(ip)[0]
    except Exception:
        return "Unknown"

def identify_cdn_hint(ip):
    if ip.startswith(("10.", "192.168.", "172.16.")):
        return "Internal Network"
    
    cdn_hints = {
        "66.249.": "Google Cache/Bot",
        "116.179.": "ISP CDN Node (Potential)",
        "220.181.": "Baidu/China CDN",
        "20.": "Microsoft/Azure",
        "52.": "AWS/Amazon",
        "13.": "Microsoft/Azure",
        "172.64.": "Cloudflare",
        "172.67.": "Cloudflare",
        "104.": "Cloudflare",
        "192.100.77.": "Unknown High Traffic (ISP?)",
    }
    
    for prefix, name in cdn_hints.items():
        if ip.startswith(prefix):
            return f"CDN/Cloud ({name})"
    
    return "External (Other)"

def analyze_traffic(input_file, output_file):
    print(f"Starting analysis on: {input_file} ...")
    summary = defaultdict(lambda: {"hits": 0, "total_flows": 0, "dst_ips": set()})
    
    try:
        if not os.path.exists(input_file):
            print(f"Error: {input_file} not found!")
            return

        with open(input_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
            hits = data.get("hits", [])
            print(f"Total hits found: {len(hits)}")
            
            for hit in hits:
                src = hit.get("src_addr")
                dst = hit.get("dst_addr")
                flows = hit.get("total_flows", 0)
                
                if dst and dst.startswith("10.27.101."):
                    summary[src]["hits"] += 1
                    summary[src]["total_flows"] += flows
                    summary[src]["dst_ips"].add(dst)
        
        external_list = []
        internal_list = []
        
        for src, info in summary.items():
            is_internal = src.startswith(("10.", "192.168.", "172.16."))
            is_ap_109 = src.startswith("10.27.109.")
            
            item = {
                "source_ip": src,
                "is_internal": is_internal,
                "is_ap_109": is_ap_109,
                "hits": info["hits"],
                "total_flows": info["total_flows"],
                "target_count": len(info["dst_ips"]),
                "targets": list(info["dst_ips"])
            }
            
            if is_internal:
                if not is_ap_109:
                    internal_list.append(item)
            else:
                external_list.append(item)
        
        external_list.sort(key=lambda x: x["hits"], reverse=True)
        internal_list.sort(key=lambda x: x["hits"], reverse=True)
        
        top_external = external_list[:50]
        top_internal = internal_list[:50]
        all_selected = top_external + top_internal
        
        print(f"Performing Reverse DNS for top 50 External and top 50 Internal (100 total)...")
        
        final_results = []
        for i, item in enumerate(all_selected):
            print(f"[{i+1}/{len(all_selected)}] Checking: {item['source_ip']}")
            item["domain"] = get_domain_name(item["source_ip"])
            item["type"] = identify_cdn_hint(item["source_ip"])
            final_results.append(item)
            
        remaining_external = external_list[50:]
        remaining_internal = internal_list[50:]
        
        for item in remaining_external + remaining_internal:
            item["domain"] = "N/A (Too many hits)"
            item["type"] = identify_cdn_hint(item["source_ip"])
            final_results.append(item)

        final_results.sort(key=lambda x: (x["is_internal"], -x["hits"]))
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(final_results, f, indent=4, ensure_ascii=False)
            
        print(f"Analysis complete! Saved to: {output_file}")
        
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    input_path = "notlike101_traffic_combined.json"
    output_path = "incoming_101_summary.json"
    analyze_traffic(input_path, output_path)
