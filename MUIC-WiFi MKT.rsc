# may/18/2026 15:50:17 by RouterOS 6.49.18
# software id = CVXT-4I8J
#
# model = CCR1036-12G-4S
# serial number = C6C60B9688EE
/interface bridge
add name=bridge-MUIC-WiFi
add name=bridge-MUWAN
add arp=proxy-arp name=bridge-MUWAN-VLAN320
add name=bridge-MUWAN-VLAN321
add name=bridge-Traffic-to-MKT02v87 pvid=87 vlan-filtering=yes
/interface vlan
add interface=bridge-Traffic-to-MKT02v87 name=Vlan87 vlan-id=87
/interface bonding
add mode=802.3ad name=2Gb-TafficVlan320 slaves=ether3,ether4
add name=2Gb-To-MKT02 slaves=ether1,ether8 transmit-hash-policy=layer-2-and-3
add mode=802.3ad name=2Gb-TrafficVlan74 slaves=ether11,ether12
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server option
add code=43 name=unifi value=0x01040A1B6519
/ip pool
add name=dhcp_pool0 ranges=192.168.10.11-192.168.10.254
add name=dhcp_pool1 ranges=192.168.10.2-192.168.10.254
add name=dhcp_pool2 ranges=192.186.20.11-192.186.20.254
add name=dhcp_pool3 ranges=192.168.20.11-192.168.20.254
add comment="Internal WiFI VLAN " name=pool-MUIC-WiFi0 ranges=\
    192.168.64.11-192.168.64.253
add name=unifi-pool0 ranges=192.168.224.10-192.168.224.253
add name=vpn-l2tp ranges=192.168.32.10-192.168.32.253
add name=projector-pool ranges=192.168.160.51-192.168.160.99
add name=dhcp_pool8 ranges=192.168.160.66-192.168.160.70
add name=dhcp_pool9 ranges=192.168.160.2-192.168.160.14
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=no lease-time=8h name=dhcp-Bridge-Std
add address-pool=dhcp_pool3 disabled=no lease-time=8h name=dhcp-Bridge-Staff
add address-pool=pool-MUIC-WiFi0 interface=bridge-MUIC-WiFi name=wifi-pool
add address-pool=unifi-pool0 disabled=no interface=ether9 lease-time=6h28m \
    name=unifi-devices
add address-pool=projector-pool interface=ether10 lease-time=6h name=\
    projector-devices
add address-pool=dhcp_pool9 disabled=no interface=ether10 name=dhcp1
/ppp profile
add dns-server=192.168.64.1 local-address=192.168.32.1 name=vpn-l2tp \
    remote-address=vpn-l2tp use-encryption=required
/queue simple
add disabled=yes max-limit=256k/256k name=queue1-10.27.22.11 target=\
    10.27.22.11/32
/queue type
add kind=pcq name=PCQ_DOWN pcq-classifier=dst-address pcq-dst-address-mask=0 \
    pcq-dst-address6-mask=64 pcq-rate=1024M pcq-src-address-mask=0 \
    pcq-src-address6-mask=64
add kind=pcq name=PCQ_UP pcq-classifier=dst-address pcq-dst-address-mask=0 \
    pcq-dst-address6-mask=64 pcq-limit=25KiB pcq-rate=25M \
    pcq-src-address-mask=0 pcq-src-address6-mask=64
/queue simple
add burst-limit=1M/1M burst-time=1s/1s disabled=yes max-limit=512k/512k name=\
    true_bw_limit packet-marks=true_bw_limit queue=PCQ_UP/PCQ_DOWN target=""
add max-limit=1024M/1024M name=super-muwan packet-marks=super-muwan target="" \
    total-queue=PCQ_DOWN
add dst=ether7 max-limit=45M/45M name=true_restriction_temp packet-marks=\
    true_bw_limit queue=PCQ_UP/PCQ_DOWN target=""
/snmp community
add addresses=10.27.101.0/24 authentication-password=IeQu0hai6Tee2Cai \
    authentication-protocol=SHA1 encryption-password=hoh0peiGhu9kieth \
    encryption-protocol=AES name=muic-101 security=private
/interface bridge nat
add action=arp-reply arp-dst-address=!10.27.22.254/32 arp-opcode=request \
    chain=dstnat disabled=yes in-interface=ether5 mac-protocol=arp \
    to-arp-reply-mac-address=C4:AD:34:E0:2D:0E
add action=arp-reply arp-dst-address=!10.27.127.254/32 arp-opcode=request \
    chain=dstnat comment="for VLAN321" in-interface=ether6 mac-protocol=arp \
    to-arp-reply-mac-address=C4:AD:34:E0:2D:0F
add action=arp-reply arp-dst-address=!10.27.123.254/32 arp-opcode=request \
    chain=dstnat comment="for VLAN320" in-interface=2Gb-TafficVlan320 \
    mac-protocol=arp to-arp-reply-mac-address=C4:AD:34:E0:2D:0C
add action=log arp-opcode=request chain=dstnat disabled=yes in-interface=\
    ether3 mac-protocol=arp
/interface bridge port
add bridge=bridge-MUWAN interface=ether5
add bridge=bridge-MUIC-WiFi interface=2Gb-TrafficVlan74 pvid=74
add bridge=bridge-MUWAN-VLAN321 interface=ether6
add bridge=bridge-MUWAN-VLAN320 interface=2Gb-TafficVlan320 pvid=320
add bridge=bridge-Traffic-to-MKT02v87 interface=2Gb-To-MKT02 pvid=87
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface bridge vlan
add bridge=bridge-Traffic-to-MKT02v87 tagged=\
    bridge-Traffic-to-MKT02v87,2Gb-To-MKT02 vlan-ids=87
/interface l2tp-server server
set authentication=mschap1,mschap2 default-profile=vpn-l2tp enabled=yes \
    ipsec-secret=aBA6T!*Hk&8sF4 keepalive-timeout=120 use-ipsec=required
/interface ovpn-server server
set auth=sha1 certificate=opvn-Server cipher=blowfish128,aes128,aes256 \
    default-profile=vpn-l2tp enabled=yes require-client-certificate=yes
/ip address
add address=110.170.31.109/27 comment="TRUE LEASED" interface=ether7 network=\
    110.170.31.96
add address=192.168.64.1/20 comment="The main @MUIC-WiFi (74)" interface=\
    bridge-MUIC-WiFi network=192.168.64.0
add address=10.27.22.1/24 comment="VLAN 122" interface=bridge-MUWAN network=\
    10.27.22.0
add address=192.168.80.1/20 comment="Spill over for Building AD" disabled=yes \
    interface=bridge-MUIC-WiFi network=192.168.80.0
add address=10.27.124.1/22 comment="VLAN 321" interface=bridge-MUWAN-VLAN321 \
    network=10.27.124.0
add address=192.168.224.1/24 comment="UniFi System (72)" interface=ether9 \
    network=192.168.224.0
add address=10.27.120.1/22 comment="VLAN 320" interface=bridge-MUWAN-VLAN320 \
    network=10.27.120.0
add address=10.27.22.14/24 comment=Super-MUWAN4 interface=bridge-MUWAN \
    network=10.27.22.0
add address=10.27.22.11/24 comment=Super-MUWAN1 interface=bridge-MUWAN \
    network=10.27.22.0
add address=10.27.22.12/24 comment=Super-MUWAN2 interface=bridge-MUWAN \
    network=10.27.22.0
add address=10.27.22.15/24 comment=Super-MUWAN5 interface=bridge-MUWAN \
    network=10.27.22.0
add address=10.27.101.207/24 comment="\"Wormhole\" to .101 subnet" interface=\
    ether2 network=10.27.101.0
add address=10.27.22.13/24 comment=Super-MUWAN3 interface=bridge-MUWAN \
    network=10.27.22.0
add address=43.251.207.139/29 comment="UIH #1" disabled=yes interface=ether1 \
    network=43.251.207.136
add address=192.168.87.5/24 comment="The ultimate PfSense mixer" interface=\
    Vlan87 network=192.168.87.0
add address=192.168.160.1/28 comment=Projector interface=ether10 network=\
    192.168.160.0
/ip dhcp-relay
add dhcp-server=192.168.64.9 disabled=no interface=bridge-MUIC-WiFi \
    local-address=192.168.64.1 name=muic-wifi-relay1
/ip dhcp-server lease
add address=192.168.224.10 comment=B1-F1-1100-SA mac-address=\
    AC:8B:A9:5C:13:31 server=unifi-devices
add address=192.168.224.224 comment=Switch-B1-F5-1502 mac-address=\
    74:83:C2:F7:0A:CE server=unifi-devices
add address=192.168.224.11 comment=B1-F1-1109-ALUMNI mac-address=\
    AC:8B:A9:5B:8E:82 server=unifi-devices
add address=192.168.224.12 comment=B1-F1-1110-PR mac-address=\
    AC:8B:A9:5B:89:76 server=unifi-devices
add address=192.168.224.13 comment=B1-F1-ACTIVITY-1 mac-address=\
    AC:8B:A9:5C:13:11 server=unifi-devices
add address=192.168.224.14 comment=B1-F1-ACTIVITY-2 mac-address=\
    AC:8B:A9:5C:0D:1D server=unifi-devices
add address=192.168.224.15 comment=B1-F1-OE-1 mac-address=AC:8B:A9:5C:0E:85 \
    server=unifi-devices
add address=192.168.224.16 comment=B1-F1-OE-2 mac-address=AC:8B:A9:5C:13:95 \
    server=unifi-devices
add address=192.168.224.17 comment=B1-F1-RECEPTION mac-address=\
    AC:8B:A9:5B:86:5E server=unifi-devices
add address=192.168.224.18 comment=B1-F2-1202-FINANCE mac-address=\
    AC:8B:A9:5C:18:1D server=unifi-devices
add address=192.168.224.19 comment=B1-F2-1210 mac-address=74:83:C2:40:45:22 \
    server=unifi-devices
add address=192.168.224.20 comment=B1-F2-1211 mac-address=AC:8B:A9:5B:D2:16 \
    server=unifi-devices
add address=192.168.224.21 comment=B1-F2-1214 mac-address=AC:8B:A9:55:84:D9 \
    server=unifi-devices
add address=192.168.224.22 comment=B1-F2-CANTEEN-INSIDE-1 mac-address=\
    AC:8B:A9:5B:E9:4E server=unifi-devices
add address=192.168.224.23 comment=B1-F2-CANTEEN-INSIDE-2 mac-address=\
    AC:8B:A9:5B:8B:86 server=unifi-devices
add address=192.168.224.24 comment=B1-F2-CANTEEN-OUTSIDE-1 mac-address=\
    AC:8B:A9:55:A8:BD server=unifi-devices
add address=192.168.224.25 comment=B1-F2-CANTEEN-OUTSIDE-2 mac-address=\
    AC:8B:A9:5C:0B:CD server=unifi-devices
add address=192.168.224.26 comment=B1-F2-CANTEEN-OUTSIDE-3 mac-address=\
    AC:8B:A9:5B:85:E2 server=unifi-devices
add address=192.168.224.27 comment=B1-F2-CANTEEN-STAFF mac-address=\
    AC:8B:A9:5C:14:51 server=unifi-devices
add address=192.168.224.28 comment=B1-F2-STUDY-LOUNGE mac-address=\
    AC:8B:A9:5C:1B:75 server=unifi-devices
add address=192.168.224.29 comment=B1-F3-1302 mac-address=E0:63:DA:B9:42:C5 \
    server=unifi-devices
add address=192.168.224.30 comment=B1-F3-1303 mac-address=E0:63:DA:B9:40:50 \
    server=unifi-devices
add address=192.168.224.31 comment=B1-F3-1304 mac-address=E0:63:DA:B9:3F:AD \
    server=unifi-devices
add address=192.168.224.32 comment=B1-F3-1305 mac-address=E0:63:DA:B9:40:26 \
    server=unifi-devices
add address=192.168.224.33 comment=B1-F3-1306 mac-address=E0:63:DA:BC:FB:A2 \
    server=unifi-devices
add address=192.168.224.34 comment=B1-F3-1307 mac-address=E0:63:DA:B9:40:38 \
    server=unifi-devices
add address=192.168.224.35 comment=B1-F3-1308 mac-address=AC:8B:A9:5B:87:AE \
    server=unifi-devices
add address=192.168.224.36 comment=B1-F3-1309 mac-address=E0:63:DA:BC:FB:92 \
    server=unifi-devices
add address=192.168.224.37 comment=B1-F3-1312 mac-address=E0:63:DA:BC:FB:9F \
    server=unifi-devices
add address=192.168.224.38 comment=B1-F3-13122-HR mac-address=\
    AC:8B:A9:5C:1C:15 server=unifi-devices
add address=192.168.224.39 comment=B1-F3-1313-LIBRARY mac-address=\
    AC:8B:A9:5B:89:4A server=unifi-devices
add address=192.168.224.40 comment=B1-F3-1314 mac-address=E0:63:DA:B9:42:BB \
    server=unifi-devices
add address=192.168.224.41 comment=B1-F3-1315 mac-address=74:83:C2:40:44:F4 \
    server=unifi-devices
add address=192.168.224.42 comment=B1-F3-13181-AUDITORIUM mac-address=\
    AC:8B:A9:5B:85:8E server=unifi-devices
add address=192.168.224.43 comment=B1-F3-13182-AUDITORIUM mac-address=\
    AC:8B:A9:5B:86:EA server=unifi-devices
add address=192.168.224.44 comment=B1-F4-1402 mac-address=74:83:C2:40:44:CF \
    server=unifi-devices
add address=192.168.224.45 comment=B1-F4-1404 mac-address=E0:63:DA:B9:40:FE \
    server=unifi-devices
add address=192.168.224.46 comment=B1-F4-1406 mac-address=74:83:C2:40:45:23 \
    server=unifi-devices
add address=192.168.224.47 comment=B1-F4-1407 mac-address=E0:63:DA:B9:42:CF \
    server=unifi-devices
add address=192.168.224.48 comment=B1-F4-1408 mac-address=E0:63:DA:B9:42:BA \
    server=unifi-devices
add address=192.168.224.49 comment=B1-F4-1409 mac-address=E0:63:DA:B9:41:38 \
    server=unifi-devices
add address=192.168.224.50 comment=B1-F4-1416-LIBRARY mac-address=\
    AC:8B:A9:5C:04:D1 server=unifi-devices
add address=192.168.224.51 comment=B1-F4-1417 mac-address=E0:63:DA:B9:41:05 \
    server=unifi-devices
add address=192.168.224.52 comment=B1-F4-1418 mac-address=74:83:C2:40:45:24 \
    server=unifi-devices
add address=192.168.224.53 comment=B1-F5-1502 mac-address=74:83:C2:40:45:2B \
    server=unifi-devices
add address=192.168.224.54 comment=B1-F5-1503 mac-address=E0:63:DA:B9:42:A3 \
    server=unifi-devices
add address=192.168.224.55 comment=B1-F5-1504 mac-address=AC:8B:A9:5C:1E:75 \
    server=unifi-devices
add address=192.168.224.56 comment=B1-F5-1506 mac-address=E0:63:DA:B9:41:10 \
    server=unifi-devices
add address=192.168.224.57 comment=B1-F5-1507 mac-address=E0:63:DA:B9:42:C3 \
    server=unifi-devices
add address=192.168.224.58 comment=B1-F5-1511-DEV mac-address=\
    74:83:C2:40:45:25 server=unifi-devices
add address=192.168.224.59 comment=B1-F5-1512 mac-address=E0:63:DA:B9:3F:AE \
    server=unifi-devices
add address=192.168.224.60 comment=B1-F5-1513 mac-address=E0:63:DA:B9:42:B7 \
    server=unifi-devices
add address=192.168.224.61 comment=B1-F5-1514 mac-address=E0:63:DA:B9:42:82 \
    server=unifi-devices
add address=192.168.224.62 comment=B1-F5-15141 mac-address=E0:63:DA:B9:42:A7 \
    server=unifi-devices
add address=192.168.224.63 comment=B1-F5-1515-IT mac-address=\
    74:83:C2:29:E6:89 server=unifi-devices
add address=192.168.224.64 comment=B1-F5-1516 mac-address=E0:63:DA:B9:42:A4 \
    server=unifi-devices
add address=192.168.224.65 comment=B3-F1-SHELTER mac-address=\
    AC:8B:A9:5C:1B:69 server=unifi-devices
add address=192.168.224.66 comment=B2-F1-2102-PC mac-address=\
    AC:8B:A9:5B:D6:3E server=unifi-devices
add address=192.168.224.67 comment=B2-F1-ENTRANCE mac-address=\
    E0:63:DA:B9:42:BF server=unifi-devices
add address=192.168.224.68 comment=B2-F1-ENTRANCE-GUARD mac-address=\
    E0:63:DA:B9:41:5C server=unifi-devices
add address=192.168.224.69 comment=B2-F1-SS mac-address=AC:8B:A9:5C:16:E9 \
    server=unifi-devices
add address=192.168.224.70 comment=B2-F2-2207 mac-address=E0:63:DA:BC:FB:9D \
    server=unifi-devices
add address=192.168.224.71 comment=B2-F2-FAC mac-address=74:83:C2:29:C9:0F \
    server=unifi-devices
add address=192.168.224.72 comment=B2-F2-HLD mac-address=AC:8B:A9:5B:84:32 \
    server=unifi-devices
add address=192.168.224.73 comment=B2-F2-SMO mac-address=E0:63:DA:B9:42:D4 \
    server=unifi-devices
add address=192.168.224.74 comment=B2-F3-2302 mac-address=E0:63:DA:B9:3F:AF \
    server=unifi-devices
add address=192.168.224.75 comment=B2-F3-2303 mac-address=E0:63:DA:B9:40:36 \
    server=unifi-devices
add address=192.168.224.76 comment=B2-F3-2307 mac-address=E0:63:DA:BC:FB:80 \
    server=unifi-devices
add address=192.168.224.77 comment=B2-F3-2308 mac-address=E0:63:DA:BC:FB:9E \
    server=unifi-devices
add address=192.168.224.78 comment=B3-F2-3201-HERB mac-address=\
    E0:63:DA:BC:FB:7B server=unifi-devices
add address=192.168.224.79 comment=B3-F3-3302 mac-address=E0:63:DA:BC:FB:AD \
    server=unifi-devices
add address=192.168.224.80 comment=B3-F3-3303 mac-address=E0:63:DA:BC:EE:93 \
    server=unifi-devices
add address=192.168.224.81 comment=B3-F3-3304 mac-address=E0:63:DA:BC:FB:AC \
    server=unifi-devices
add address=192.168.224.82 comment=B3-F3-3305 mac-address=E0:63:DA:B9:42:C8 \
    server=unifi-devices
add address=192.168.224.83 comment=B3-F3-3306 mac-address=E0:63:DA:BC:FB:A3 \
    server=unifi-devices
add address=192.168.224.84 comment=B3-F3-3307 mac-address=E0:63:DA:BC:FD:F6 \
    server=unifi-devices
add address=192.168.224.85 comment=B3-F3-3315 mac-address=E0:63:DA:BC:FB:99 \
    server=unifi-devices
add address=192.168.224.86 comment=B3-F3-3316 mac-address=E0:63:DA:BC:FB:94 \
    server=unifi-devices
add address=192.168.224.87 comment=B3-F3-3317 mac-address=E0:63:DA:B9:42:D7 \
    server=unifi-devices
add address=192.168.224.88 comment=B3-F4-3407 mac-address=E0:63:DA:BC:FB:A6 \
    server=unifi-devices
add address=192.168.224.89 comment=B3-F4-3408 mac-address=E0:63:DA:BC:FB:A5 \
    server=unifi-devices
add address=192.168.224.90 comment=B3-F4-3409 mac-address=E0:63:DA:BC:FB:7C \
    server=unifi-devices
add address=192.168.224.91 comment=B3-F4-3410 mac-address=E0:63:DA:B9:40:31 \
    server=unifi-devices
add address=192.168.224.92 comment=B3-F4-3411 mac-address=E0:63:DA:B9:3F:95 \
    server=unifi-devices
add address=192.168.224.93 comment=B3-F4-3412 mac-address=E0:63:DA:B9:40:65 \
    server=unifi-devices
add address=192.168.224.94 comment=B3-F4-3414 mac-address=E0:63:DA:B9:42:B4 \
    server=unifi-devices
add address=192.168.224.95 comment=B3-F4-3415 mac-address=E0:63:DA:BC:ED:49 \
    server=unifi-devices
add address=192.168.224.96 comment=B3-F4-3420 mac-address=E0:63:DA:BC:FB:A0 \
    server=unifi-devices
add address=192.168.224.97 comment=B3-F4-3421 mac-address=E0:63:DA:BC:FB:9B \
    server=unifi-devices
add address=192.168.224.98 comment=B3-F4-3422 mac-address=E0:63:DA:BC:F7:0A \
    server=unifi-devices
add address=192.168.224.99 comment=B3-F5-35011 mac-address=74:83:C2:29:CB:A9 \
    server=unifi-devices
add address=192.168.224.100 comment=B3-F5-35012 mac-address=74:83:C2:29:D4:27 \
    server=unifi-devices
add address=192.168.224.101 comment=B3-F5-3502 mac-address=E0:63:DA:B9:40:CF \
    server=unifi-devices
add address=192.168.224.102 comment=B3-F5-3504 mac-address=E0:63:DA:B9:42:D8 \
    server=unifi-devices
add address=192.168.224.103 comment=B3-F5-3505 mac-address=E0:63:DA:B9:42:8A \
    server=unifi-devices
add address=192.168.224.104 comment=B3-F5-3508 mac-address=E0:63:DA:B9:40:54 \
    server=unifi-devices
add address=192.168.224.105 comment=B3-F6-HR mac-address=E4:38:83:16:DD:13 \
    server=unifi-devices
add address=192.168.224.106 comment=SCI-F6-Pro-01 mac-address=\
    60:22:32:F7:6F:4D server=unifi-devices
add address=192.168.224.107 comment=SCI-F6-Pro-02 mac-address=\
    60:22:32:F7:63:ED server=unifi-devices
add address=192.168.224.108 comment=SCI-F6-Pro-03 mac-address=\
    60:22:32:F7:75:A1 server=unifi-devices
add address=192.168.224.109 comment=SCI-F6-Pro-04 mac-address=\
    60:22:32:F7:66:B5 server=unifi-devices
add address=192.168.224.110 comment=SCI-F6-Pro-05 mac-address=\
    60:22:32:F7:67:C9 server=unifi-devices
add address=192.168.224.112 comment=SCI-F6-Pro-07 mac-address=\
    60:22:32:F6:B8:6D server=unifi-devices
add address=192.168.224.225 comment="\tB1F4-R1411-UNIFI" mac-address=\
    74:83:C2:F7:08:85 server=unifi-devices
add address=192.168.224.226 comment=Switch-B1-F5-1515 mac-address=\
    74:83:C2:F7:0A:47 server=unifi-devices
add address=192.168.224.227 comment=Switch-B2-F1-RackPC mac-address=\
    74:83:C2:F7:07:23 server=unifi-devices
add address=192.168.224.228 comment=Switch-B3-F3-RackFl3 mac-address=\
    74:83:C2:F7:08:CD server=unifi-devices
add address=192.168.224.229 comment=Switch-B3-F4-RackFl4 mac-address=\
    74:83:C2:F7:0A:B3 server=unifi-devices
add address=192.168.224.230 comment=Switch-B3-F5-RackFl5 mac-address=\
    E0:63:DA:CD:F2:B9 server=unifi-devices
add address=192.168.224.111 comment=SCI-F6-Pro-06 mac-address=\
    60:22:32:F7:74:0D server=unifi-devices
add address=192.168.224.113 client-id=1:18:3:73:2f:c2:19 comment=\
    "Server Reboot AP Unifi" mac-address=18:03:73:2F:C2:19 server=\
    unifi-devices
add address=192.168.224.115 comment=B1-F3-1318/3-AUDITORIUM mac-address=\
    AC:8B:A9:5B:7F:12 server=unifi-devices
add address=192.168.224.116 comment=B3-F4-EDTECH mac-address=\
    74:83:C2:29:CB:E7 server=unifi-devices
add address=192.168.224.117 comment=B3-F6-HK-DEPT mac-address=\
    0C:EA:14:E6:37:2D server=unifi-devices
add address=192.168.224.221 comment=B3F6R3619-UNIFI mac-address=\
    1C:6A:1B:2C:16:0A server=unifi-devices
add address=192.168.224.119 comment=B3-F6-MAHA2 mac-address=0C:EA:14:E6:77:1D \
    server=unifi-devices
add address=192.168.224.120 comment=B3-F6-NARA mac-address=0C:EA:14:E6:79:DD \
    server=unifi-devices
add address=192.168.224.118 comment=B3-F6-MAHA1 mac-address=0C:EA:14:E3:1F:F9 \
    server=unifi-devices
add address=192.168.224.222 comment=B3F7R3715-UNIFI mac-address=\
    1C:6A:1B:2C:16:7F server=unifi-devices
add address=192.168.224.223 comment=B3F8R3812-UNIFI mac-address=\
    1C:6A:1B:2C:16:43 server=unifi-devices
add address=192.168.224.124 comment=IW-R700 mac-address=0C:EA:14:5E:49:B9 \
    server=unifi-devices
add address=192.168.224.126 comment=IW-R702 mac-address=0C:EA:14:5E:49:45 \
    server=unifi-devices
add address=192.168.224.127 comment=IW-R701 mac-address=0C:EA:14:5E:49:19 \
    server=unifi-devices
add address=192.168.224.128 comment=IW-R703 mac-address=0C:EA:14:5E:40:1D \
    server=unifi-devices
add address=192.168.224.129 comment=IW-R704 mac-address=1C:6A:1B:1B:09:05 \
    server=unifi-devices
add address=192.168.224.130 comment=IW-R705 mac-address=0C:EA:14:FA:F5:61 \
    server=unifi-devices
add address=192.168.224.131 comment=IW-R706 mac-address=0C:EA:14:FA:F4:85 \
    server=unifi-devices
add address=192.168.224.132 comment=IW-R707 mac-address=0C:EA:14:FA:F3:9D \
    server=unifi-devices
add address=192.168.224.133 comment=IW-R708 mac-address=1C:6A:1B:1B:01:AD \
    server=unifi-devices
add address=192.168.224.134 comment=IW-R709 mac-address=0C:EA:14:FA:F3:E9 \
    server=unifi-devices
add address=192.168.224.135 comment=IW-R710 mac-address=0C:EA:14:FA:F5:35 \
    server=unifi-devices
add address=192.168.224.136 comment=IW-R711 mac-address=0C:EA:14:FA:F4:CD \
    server=unifi-devices
add address=192.168.224.137 comment=IW-R712 mac-address=1C:6A:1B:1B:22:B9 \
    server=unifi-devices
add address=192.168.224.138 comment=IW-R714 mac-address=0C:EA:14:FA:F4:AD \
    server=unifi-devices
add address=192.168.224.139 comment=IW-R800 mac-address=0C:EA:14:FA:F4:01 \
    server=unifi-devices
add address=192.168.224.140 comment=IW-R801 mac-address=0C:EA:14:FA:F7:75 \
    server=unifi-devices
add address=192.168.224.141 comment=IW-R802 mac-address=6C:63:F8:1D:8B:A9 \
    server=unifi-devices
add address=192.168.224.142 comment=IW-R803 mac-address=6C:63:F8:15:47:BF \
    server=unifi-devices
add address=192.168.224.143 comment=IW-R804 mac-address=6C:63:F8:1D:8B:75 \
    server=unifi-devices
add address=192.168.224.144 comment=IW-R805 mac-address=1C:6A:1B:5F:F8:2F \
    server=unifi-devices
add address=192.168.224.145 comment=IW-R806 mac-address=6C:63:F8:1D:8B:DD \
    server=unifi-devices
add address=192.168.224.146 comment=IW-R807 mac-address=6C:63:F8:1D:8B:5D \
    server=unifi-devices
add address=192.168.224.147 comment=IW-R808 mac-address=6C:63:F8:15:4A:8B \
    server=unifi-devices
add address=192.168.224.148 comment=IW-R809 mac-address=6C:63:F8:1D:8C:45 \
    server=unifi-devices
add address=192.168.224.149 comment=IW-R810 mac-address=6C:63:F8:1D:8C:3D \
    server=unifi-devices
add address=192.168.224.150 comment=IW-R811 mac-address=6C:63:F8:1D:8B:09 \
    server=unifi-devices
add address=192.168.224.200 comment=Switch-B1F5DCR3-F-O-USW mac-address=\
    0C:EA:14:CD:00:33 server=unifi-devices
add address=192.168.224.186 client-id=1:1c:6a:1b:5b:81:2c comment=\
    B1F5DCR1-UNIFI-24P mac-address=1C:6A:1B:5B:81:2C server=unifi-devices
/ip dhcp-server network
add address=192.168.10.0/24 dns-server=203.144.128.194 gateway=192.168.10.1
add address=192.168.20.0/24 gateway=192.168.20.1
add address=192.168.64.0/24 dns-server=192.168.64.1 gateway=192.168.64.1 \
    netmask=24
add address=192.168.160.0/28 dns-server=192.168.64.1 gateway=192.168.160.1
add address=192.168.224.0/24 dhcp-option=unifi dns-server=192.168.64.1 \
    gateway=192.168.224.1 netmask=24
add address=192.186.20.0/24 gateway=192.186.20.1
/ip dns
set allow-remote-requests=yes max-concurrent-queries=2048 \
    max-concurrent-tcp-sessions=80 servers=192.168.64.3
/ip firewall address-list
add address=192.168.64.0/20 list=DIRECT
add address=110.170.31.96/27 list=DIRECT
add address=192.168.224.0/24 list=DIRECT
add address=192.168.64.0/20 list=MUICWIFI
add address=10.27.22.0/24 list=DIRECT
add address=192.168.32.0/24 list=DIRECT
add address=13.107.64.0/18 list=MSTeams
add address=52.112.0.0/14 list=MSTeams
add address=52.120.0.0/14 list=MSTeams
add address=52.238.119.141 list=MSTeams
add address=43.251.207.136/29 disabled=yes list=DIRECT
add address=192.168.87.0/24 list=DIRECT
add address=10.0.0.0/8 comment="Will keep on MKT for further routing " list=\
    KEEP_ON_MKT
add address=110.170.31.96/27 list=KEEP_ON_MKT
add address=192.168.0.0/16 list=KEEP_ON_MKT
add address=43.251.207.136/29 disabled=yes list=KEEP_ON_MKT
add address=192.168.99.0/24 list=DIRECT
/ip firewall filter
add action=passthrough chain=forward disabled=yes
add action=fasttrack-connection chain=forward connection-mark=muwan-vlan320
add action=fasttrack-connection chain=forward connection-mark=muwan-vlan321
add action=fasttrack-connection chain=forward routing-mark=ng-ultimate-mixer
add action=fasttrack-connection chain=forward routing-mark=\
    proxmox-ultimate-mixer
add action=accept chain=input comment=\
    "Accept established and related packets" connection-state=\
    established,related
add action=accept chain=input disabled=yes dst-port=4500 protocol=udp
add action=accept chain=input dst-port=500,1194,1701,4500 protocol=udp \
    src-address=10.27.0.0/16
add action=accept chain=input protocol=ipsec-ah
add action=accept chain=input protocol=ipsec-esp
add action=drop chain=input comment="Drop invalid packets" connection-state=\
    invalid
add action=drop chain=input connection-state=!established in-interface=ether7
add action=drop chain=input connection-state=!established disabled=yes \
    in-interface=ether1
add action=drop chain=input dst-address=192.168.64.1 dst-port=80 protocol=tcp \
    src-address=192.168.64.0/20
add action=accept chain=input connection-state=established,related,untracked \
    disabled=yes
/ip firewall mangle
add action=accept chain=prerouting comment="accept : dst-address-list=DIRECT" \
    dst-address-list=DIRECT log-prefix=rd1
add action=mark-routing chain=prerouting comment="Route all permitted TCP traf\
    fic for non-MU, non-MUIC destinations to the Proxmox + ultimate mixer" \
    connection-mark=no-mark dst-address-list=!KEEP_ON_MKT dst-port=\
    22,53,80,123,443,853,1000-65535 new-routing-mark=proxmox-ultimate-mixer \
    passthrough=no protocol=tcp src-address=192.168.64.0/20 src-address-list=\
    MUICWIFI
add action=mark-routing chain=prerouting comment="Route all permitted TCP traf\
    fic for non-MU, non-MUIC destinations to the ultimate mixer" \
    connection-mark=no-mark disabled=yes dst-address-list=!KEEP_ON_MKT \
    dst-port=22,53,80,123,443,853,1000-65535 new-routing-mark=\
    ng-ultimate-mixer passthrough=no protocol=tcp src-address-list=MUICWIFI
add action=mark-routing chain=prerouting comment="Route all permitted UDP traf\
    fic for non-MU, non-MUIC destinations to the Proxmox +  ultimate mixer" \
    connection-mark=no-mark dst-address-list=!KEEP_ON_MKT dst-port=\
    53,123,443,853,1000-65535 new-routing-mark=proxmox-ultimate-mixer \
    passthrough=no protocol=udp src-address=192.168.64.0/20 src-address-list=\
    MUICWIFI
add action=mark-routing chain=prerouting comment="Route all permitted UDP traf\
    fic for non-MU, non-MUIC destinations to the ultimate mixer" \
    connection-mark=no-mark disabled=yes dst-address-list=!KEEP_ON_MKT \
    dst-port=53,123,443,853,1000-65535 new-routing-mark=ng-ultimate-mixer \
    passthrough=no protocol=udp src-address-list=MUICWIFI
add action=mark-routing chain=prerouting comment=\
    "Route icmp (ping) to Proxmox + ultimate-mixer" connection-mark=no-mark \
    disabled=yes dst-address-list=!KEEP_ON_MKT new-routing-mark=\
    proxmox-ultimate-mixer passthrough=no protocol=icmp src-address=\
    192.168.64.0/20 src-address-list=MUICWIFI
add action=mark-routing chain=prerouting comment=\
    "Route icmp (ping) to ultimate-mixer" connection-mark=no-mark \
    dst-address-list=!KEEP_ON_MKT new-routing-mark=ng-ultimate-mixer \
    passthrough=no protocol=icmp src-address-list=MUICWIFI
add action=mark-routing chain=prerouting comment="Route mgmt AP permitted TCP \
    traffic for non-MU, non-MUIC destinations to the ultimate mixer" \
    connection-mark=no-mark dst-address-list=!KEEP_ON_MKT dst-port=22,53,443 \
    new-routing-mark=ng-ultimate-mixer passthrough=no protocol=tcp \
    src-address=192.168.224.0/24 src-address-list=""
add action=passthrough chain=prerouting dst-address=10.0.0.0/8 in-interface=\
    bridge-MUIC-WiFi
add action=passthrough chain=prerouting connection-mark=no-mark disabled=yes \
    dst-address=!10.0.0.0/8 dst-port=443 in-interface=bridge-MUIC-WiFi \
    protocol=tcp
add action=passthrough chain=prerouting disabled=yes protocol=tcp src-port=\
    443
add action=mark-connection chain=prerouting connection-mark=no-mark \
    dst-address=202.28.0.0/16 dst-port=22,80,443,1000-65535 \
    new-connection-mark=leased_bw passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting comment=\
    "Treat all .32 (l2tp) as going to supermuwan-1" connection-mark=no-mark \
    new-connection-mark=leased_bw passthrough=yes src-address=192.168.32.0/24
add action=mark-connection chain=prerouting connection-mark=no-mark \
    dst-address=!10.0.0.0/8 dst-port=53,22,80,1000-65535 new-connection-mark=\
    uih-conn passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting connection-mark=no-mark \
    dst-address=!10.0.0.0/8 dst-port=53,123,443,1000-65535 \
    new-connection-mark=uih-conn passthrough=yes protocol=udp
add action=mark-routing chain=prerouting connection-mark=leased_bw \
    new-routing-mark=nonSSL passthrough=yes
add action=mark-routing chain=output connection-mark=leased_bw \
    new-routing-mark=nonSSL passthrough=yes
add action=mark-connection chain=prerouting connection-mark=no-mark \
    in-interface=bridge-MUIC-WiFi new-connection-mark=muwan-vlan321 \
    passthrough=yes src-address=192.168.68.0/22
add action=mark-routing chain=prerouting connection-mark=muwan-vlan321 \
    new-routing-mark=muwan-vlan321 passthrough=no
add action=mark-connection chain=prerouting connection-mark=no-mark \
    in-interface=bridge-MUIC-WiFi new-connection-mark=muwan-vlan320 \
    passthrough=yes src-address=192.168.64.0/22
add action=mark-routing chain=prerouting connection-mark=muwan-vlan320 \
    new-routing-mark=muwan-vlan320 passthrough=no
add action=mark-packet chain=forward new-packet-mark=true_bw_limit \
    passthrough=yes routing-mark=nonSSL
add action=mark-packet chain=prerouting new-packet-mark=true_bw_limit \
    passthrough=yes routing-mark=nonSSL
add action=mark-packet chain=forward new-packet-mark=super-muwan passthrough=\
    yes routing-mark=supermuwan-1
add action=mark-routing chain=prerouting comment=\
    "UIH: Conn -> Route (prerouting) - temp to super mixer" connection-mark=\
    uih-conn new-routing-mark=ng-ultimate-mixer passthrough=yes
add action=mark-routing chain=output connection-mark=uih-conn \
    new-routing-mark=ng-ultimate-mixer passthrough=yes
/ip firewall nat
add action=masquerade chain=srcnat disabled=yes
add action=dst-nat chain=dstnat disabled=yes port=53 protocol=udp \
    to-addresses=192.168.64.1 to-ports=53
add action=accept chain=srcnat comment="NAT : dst-address-list=DIRECT" \
    dst-address=192.168.0.0/16 dst-address-list=DIRECT
add action=accept chain=srcnat comment=\
    -------------------------------------------------------------------- \
    routing-mark=ultimate-mix
add action=src-nat chain=srcnat comment="NAT Rule - supermuwan-1" \
    routing-mark=supermuwan-1 to-addresses=10.27.22.11
add action=src-nat chain=srcnat comment="NAT Rule - supermuwan-2 " \
    routing-mark=supermuwan-2 to-addresses=10.27.22.12
add action=src-nat chain=srcnat comment="NAT Rule - supermuwan-3" \
    routing-mark=supermuwan-3 to-addresses=10.27.22.13
add action=src-nat chain=srcnat comment="NAT Rule - supermuwan-4" \
    routing-mark=supermuwan-4 to-addresses=10.27.22.14
add action=accept chain=srcnat comment="Accept rule ro PF Sense" \
    routing-mark=ng-ultimate-mixer
add action=accept chain=srcnat comment="Accept rule ro PF Sense" \
    routing-mark=proxmox-ultimate-mixer
add action=dst-nat chain=dstnat comment=\
    ------------------------------------------------------------ dst-address=\
    10.27.22.1 dst-port=3389 protocol=tcp to-addresses=192.168.64.253 \
    to-ports=3389
add action=dst-nat chain=dstnat dst-address=10.27.22.1 dst-port=2222 \
    protocol=tcp to-addresses=192.168.64.9 to-ports=22
add action=masquerade chain=srcnat comment="Out to TRUE Subnet" \
    out-interface=ether7
add action=masquerade chain=srcnat comment="Out to UIH subnet" disabled=yes \
    out-interface=ether1
add action=netmap chain=srcnat disabled=yes src-address=192.168.64.0/24 \
    to-addresses=10.27.22.0/24
add action=netmap chain=srcnat comment=\
    "Out to MU Vlan 320 ; Half of IP @MUIC-WiFi ;;;" src-address=\
    192.168.64.0/22 to-addresses=10.27.120.0/22
add action=netmap chain=dstnat disabled=yes dst-address=10.27.22.0/24 \
    in-interface=bridge-MUWAN to-addresses=192.168.64.0/24
add action=masquerade chain=srcnat disabled=yes routing-mark=nonSSL \
    to-addresses=0.0.0.0
add action=netmap chain=srcnat comment=\
    "Out to MU Vlan 321 ; Half of IP @MUIC-WiFi" src-address=192.168.68.0/22 \
    to-addresses=10.27.124.0/22
add action=masquerade chain=srcnat disabled=yes src-address=192.168.80.0/20
add action=src-nat chain=srcnat comment=\
    "All addredd @MUIC-WiFi -->Nat to ip Vlan 320" src-address-list=MUICWIFI \
    to-addresses=10.27.120.2-10.27.123.253
add action=src-nat chain=srcnat comment=\
    "All addredd @MUIC-WiFi -->Nat to ip Vlan 320" disabled=yes \
    src-address-list=MUICWIFI to-addresses=10.27.124.2-10.27.127.253
add action=masquerade chain=srcnat comment=\
    "Nat of Unifi System to Local MUIC" out-interface=!bridge-MUIC-WiFi \
    src-address=192.168.224.0/24 to-addresses=10.27.120.2-10.27.123.253
/ip firewall raw
add action=add-dst-to-address-list address-list=Zoom address-list-timeout=30m \
    chain=prerouting dst-port=3478-3479,8801-8810 protocol=udp \
    src-address-list=MUICWIFI
/ip route
add check-gateway=ping comment="Route to the original ultimate mixer" \
    distance=1 gateway=192.168.87.250 routing-mark=ng-ultimate-mixer
add distance=1 dst-address=192.168.64.0/20 gateway=bridge-MUIC-WiFi \
    routing-mark=ng-ultimate-mixer
add distance=1 gateway=110.170.31.97 routing-mark=nonSSL
add disabled=yes distance=1 dst-address=192.168.80.0/20 gateway=\
    bridge-MUIC-WiFi routing-mark=nonSSL
add distance=1 gateway=10.27.127.254 routing-mark=muwan-vlan321
add distance=1 dst-address=192.168.64.0/20 gateway=bridge-MUIC-WiFi \
    routing-mark=muwan-vlan321
add check-gateway=ping distance=1 gateway=10.27.123.254 routing-mark=\
    muwan-vlan320
add distance=1 dst-address=192.168.64.0/20 gateway=bridge-MUIC-WiFi \
    routing-mark=muwan-vlan320
add distance=1 gateway=10.27.22.254 pref-src=10.27.22.11 routing-mark=\
    supermuwan-1
add check-gateway=ping disabled=yes distance=1 gateway=192.168.87.254 \
    routing-mark=ultimate-mix
add distance=1 dst-address=192.168.64.0/20 gateway=bridge-MUIC-WiFi \
    routing-mark=ultimate-mix
add distance=1 gateway=10.27.22.254 pref-src=10.27.22.12 routing-mark=\
    supermuwan-2
add distance=1 gateway=10.27.22.254 pref-src=10.27.22.13 routing-mark=\
    supermuwan-3
add distance=1 gateway=10.27.22.254 pref-src=10.27.22.14 routing-mark=\
    supermuwan-4
add check-gateway=ping comment="NG Ultimate mixer on Proxmox" distance=1 \
    gateway=192.168.87.251 routing-mark=proxmox-ultimate-mixer
add distance=1 dst-address=192.168.64.0/20 gateway=bridge-MUIC-WiFi \
    routing-mark=proxmox-ultimate-mixer
add distance=1 gateway=10.27.22.254
add distance=1 dst-address=1.1.1.1/32 gateway=110.170.31.97
add distance=1 dst-address=8.8.8.8/32 gateway=110.170.31.97
add distance=1 dst-address=192.168.99.0/24 gateway=192.168.87.254
add comment="special route to test radius" distance=1 dst-address=\
    192.168.99.18/32 gateway=192.168.87.250
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www address=10.27.100.0/24,192.168.64.0/20
set ssh address=192.168.64.0/21,10.27.0.0/16
set api address=192.168.64.0/21,10.27.0.0/16 disabled=yes
set winbox address=192.168.64.0/20,10.27.0.0/16
set api-ssl address=192.168.64.0/21,10.27.0.0/16 disabled=yes
/ip traffic-flow
set enabled=yes
/ip traffic-flow ipfix
set nat-events=yes
/ip traffic-flow target
add dst-address=10.27.100.106 version=ipfix
add disabled=yes dst-address=10.27.203.107 version=ipfix
add disabled=yes dst-address=10.27.101.21
add disabled=yes dst-address=10.27.101.23
add disabled=yes dst-address=10.27.101.32 port=14739 version=ipfix
add disabled=yes dst-address=192.168.71.223 port=9995 version=5
add disabled=yes dst-address=10.27.101.23 port=2100 version=ipfix
add dst-address=10.27.100.106 port=2100 version=ipfix
/ppp secret
add name=ktangwon password=hello4660 profile=vpn-l2tp service=l2tp
add name=keystone password="V#dp9i7FZ*5z5\$" profile=vpn-l2tp service=l2tp
add name=latte password=0myC4t profile=vpn-l2tp service=ovpn
/snmp
set enabled=yes engine-id=mkt-muic-wifi trap-community=muic-101 \
    trap-generators=start-trap,interfaces trap-interfaces=all trap-version=3
/system clock
set time-zone-name=Asia/Bangkok
/system identity
set name="MUIC-WiFi MKT"
/system ntp client
set enabled=yes primary-ntp=10.27.1.201
/system package update
set channel=long-term
/tool graphing interface
add
/tool graphing queue
add simple-queue=true_bw_limit
add simple-queue=super-muwan
add simple-queue=true_restriction_temp
/tool graphing resource
add
/tool sniffer
set filter-interface=bridge-MUIC-WiFi filter-ip-address=192.168.64.9/32 \
    filter-operator-between-entries=and
