import json
import os
import socket
from collections import defaultdict

os.chdir(os.path.dirname(os.path.abspath(__file__)))

def get_domain_name(ip):
    try:
        socket.setdefaulttimeout(0.5)
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
    }
    for prefix, name in cdn_hints.items():
        if ip.startswith(prefix): return f"CDN/Cloud ({name})"
    return "External (Other)"

def analyze_traffic(input_file, output_file):
    print(f"Starting analysis on: {input_file} ...")
    
    # summary structure: { src_ip: { hits: X, flows: Y, targets: { dst_ip: hits_count }, ports: set } }
    summary = defaultdict(lambda: {
        "hits": 0, 
        "total_flows": 0, 
        "target_breakdown": defaultdict(int),
        "ports": set()
    })
    
    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
            hits = data.get("hits", [])
            
            for hit in hits:
                src = hit.get("src_addr")
                dst = hit.get("dst_addr")
                port = hit.get("dst_port")
                flows = hit.get("total_flows", 0)
                
                if dst and dst.startswith("10.27.101."):
                    summary[src]["hits"] += 1
                    summary[src]["total_flows"] += flows
                    summary[src]["target_breakdown"][dst] += 1
                    if port: summary[src]["ports"].add(port)
        
        all_list = []
        for src, info in summary.items():
            is_internal = src.startswith(("10.", "192.168.", "172.16."))
            
            # Convert target breakdown to sorted list of objects
            target_list = []
            for t_ip, t_hits in info["target_breakdown"].items():
                target_list.append({"ip": t_ip, "hits": t_hits})
            target_list.sort(key=lambda x: x["hits"], reverse=True)

            all_list.append({
                "source_ip": src,
                "is_internal": is_internal,
                "hits": info["hits"],
                "total_flows": info["total_flows"],
                "target_count": len(info["target_breakdown"]),
                "targets": target_list, # New breakdown format
                "ports": sorted(list(info["ports"]))[:10]
            })
        
        # DNS Enrichment for Top 100
        external_sorted = sorted([x for x in all_list if not x["is_internal"]], key=lambda x: x["hits"], reverse=True)
        internal_sorted = sorted([x for x in all_list if x["is_internal"] and not x["source_ip"].startswith("10.27.109.")], key=lambda x: x["hits"], reverse=True)
        selected_ips = {x["source_ip"] for x in (external_sorted[:50] + internal_sorted[:50])}
        
        final_results = []
        print(f"Enriching top IPs with Domain Names...")
        for item in all_list:
            item["domain"] = get_domain_name(item["source_ip"]) if item["source_ip"] in selected_ips else "N/A"
            item["type"] = identify_cdn_hint(item["source_ip"])
            final_results.append(item)

        final_results.sort(key=lambda x: (x["is_internal"], -x["hits"]))
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(final_results, f, indent=4, ensure_ascii=False)
        print("Analysis complete!")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    analyze_traffic("notlike101_traffic_combined.json", "incoming_101_summary.json")
