
# SRv6 Unaware Evaluation

![](./topo.jpeg)

send icmp traffic including `emacs` at R1
```
R1# ping 10.0.0.2 -p 656d6163732c
PATTERN: 0x656d6163732c
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
64 bytes from 10.0.0.2: icmp_seq=1 ttl=64 time=0.038 ms
64 bytes from 10.0.0.2: icmp_seq=2 ttl=64 time=0.075 ms
...
```

check traffic at R2
```
root@R2:/# tcpdump -ni net0 -XX
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on net0, link-type EN10MB (Ethernet), capture size 262144 bytes
13:43:25.315353 IP 10.0.0.1 > 10.0.0.2: ICMP echo request, id 64, seq 5, length 64
        0x0000:  b6e5 b767 af7b c688 a57b 07bd 0800 4500  ...g.{...{....E.
        0x0010:  0054 41ce 4000 4001 e4d8 0a00 0001 0a00  .TA.@.@.........
        0x0020:  0002 0800 a443 0040 0005 fdc1 665c 0000  .....C.@....f\..
        0x0030:  0000 b6cf 0400 0000 0000 732c 656d 6163  ..........s,emac
        0x0040:  732c 656d 6163 732c 656d 6163 732c 656d  s,emacs,emacs,em
        0x0050:  6163 732c 656d 6163 732c 656d 6163 732c  acs,emacs,emacs,
        0x0060:  656d                                     em
```


