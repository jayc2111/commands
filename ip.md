# ip

## netstat
- `netstat -tapen`: show all current TCP connections


## tcpdump
-i … define the interface  
-n … show IP addresses  
-l … Make stdout line buffered  
-s … limit capture size per frame (use -s0 to get the complete frame)  
-A … Print each packet (minus its link level header) in ASCII  
-X … show HEX and ASCII (packet content)  
-x … show HEX (packet content)  

### examples
```
tcpdump -i any dst 192.168.2.14 -X > log2.txt
tcpdump -i eth1 dst 192.168.2.14 -X > log2.txt
tcpdump -i any host 192.168.2.14 -X > log2.txt
tcpdump -i any port 50022 or port 50023 -X > log2.txt
```

### to file:
```
tcpdump -i any -X port 50023 and src 192.168.2.12 -w file.pcap
```

### from file:
```
tcpdump -qns 0 -X -r cpua_trace.pcap
tcpdump -n -X -r cpua_trace.pcap
tcpdump -n "dst port 4391 or dst port 4135 or dst port 10000"
```

### Filter host:
```
Host x.x.x.x
dst host, net, port or portrange
src host, net, port or portrange
Port x
```

### Filter network:
- `net 192.168.0`: all in my local home net
- `not net 192.168.0`: exclude all home net
- `net 52`: all from 52.0.0.0 till 52.255.255.255

Also special ports like: 80, 443, 22, …


### All UDP from a file:
```
tcpdump -n proto UDP -r atp_tsg_log_testRun.pcap0 > all.txt
tcpdump -n proto UDP and host 192.168.2.14 -r atp_tsg_log_testRun.pcap0 > all_OPC.txt
tcpdump -nx port 50011 or port 50010 -r atp_tsg_log_testRun.pcap0 > all_OPC2.txt 
```

### refs
[1](https://docs.netgate.com/pfsense/en/latest/diagnostics/packetcapture/tcpdump.html#w-flag)

## UDP
simple testing:
```
echo -n "hello" | nc -u -q1 localhost 5514
echo "This is my data" > /dev/udp/127.0.0.1/5514
```
