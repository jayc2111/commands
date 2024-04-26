# ip

## netstat
show all current TCP connections:
```sh
netstat -tapen
```


## tcpdump
-i … define the interface  
-n … show IP addresses  
-l … make stdout line buffered  
-s … limit capture size per frame (use -s0 to get the complete frame)  
-A … Print each packet (minus its link level header) in ASCII  
-X … show HEX and ASCII (packet content)  
-x … show HEX (packet content)  
-r … read from pcap file
-w … write to pcap file

### examples
```sh
tcpdump -i eth1 dst 192.168.2.14 -X
tcpdump -i any host 192.168.2.14 -X > <file_name>
tcpdump -i any port 50022 or port 50023 -X > <file_name>
```

### to file:
```sh
tcpdump -i any -X port 50023 and src 192.168.2.12 -w <file>.pcap
```

### from file:
```sh
tcpdump -qns 0 -X -r <file>.pcap
tcpdump -n -X -r <file>.pcap
tcpdump -n "dst port 4391 or dst port 4135 or dst port 10000"
```

all UDP from a file:
```sh
tcpdump -n proto UDP and host 192.168.2.14 -r <file>.pcap > <file_name>
tcpdump -nx port 50011 or port 50010 -r <file>.pcap > <file_name> 
```

### filter host:
```sh
Host x.x.x.x
dst host, net, port or portrange
src host, net, port or portrange
Port x
```

### filter network:
all in my local home net:
```sh
net 192.168.0
```

exclude all home net:
```sh
not net 192.168.0
```

all from 52.0.0.0 till 52.255.255.255:
```sh
net 52
```

> Also special ports like: 80, 443, 22, …

### refs
[netgate docu](https://docs.netgate.com/pfsense/en/latest/diagnostics/packetcapture/tcpdump.html#w-flag)


## ip command
```sh
ip link show
ip --color addr show
ip link set dev <name> down
ip link set dev <name> up
```

check ARP:
```sh
 ip neigh show
```

[IP command docu](https://www.tecmint.com/ip-command-examples/)

## UDP
simple testing:
```sh
echo -n "hello" | nc -u -q1 localhost 5514
echo "This is my data" > /dev/udp/127.0.0.1/5514
```
