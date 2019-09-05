
# Pseudo End.DT4 Hacks

configuration is written on [spec.yaml](spec.yaml).
following AA shows L2-topology of this example.
In this example, container node R1 performs 
pseudo End.DT4 behaviour using vrf route-leaking.
I'm not sure this hacks is valid or not, sorry.
```
                                                        +--------+
                                        10.1.0.0/24     |        |
                                  .1[net1]------------[net1] C2  |
+--------+    2001::/64     +--------+                .2|        |
|        |    10.0.0.0/24   |        |                  +--------+
|   C1 [net0]------------[net0]  R1  |
|        |.2              .1|        |                  +--------+
+--------+                  +--------+                .2|        |
                                  .1[net2]------------[net3] C3  |
                                        10.1.0.0/24     |        |
                                                        +--------+
```

vrf infomation is included following cli-output.
```
$ docker exec R1 ip -d link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00 promiscuity 0 addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
2: net0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether da:54:a9:51:5c:73 brd ff:ff:ff:ff:ff:ff link-netnsid 0 promiscuity 0
    veth addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
3: net1@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master red state UP mode DEFAULT group default qlen 1000
    link/ether e6:97:0e:98:d9:ac brd ff:ff:ff:ff:ff:ff link-netnsid 1 promiscuity 0
    veth
    vrf_slave table 10 addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
4: net2@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master blu state UP mode DEFAULT group default qlen 1000
    link/ether da:06:d8:c4:e5:b0 brd ff:ff:ff:ff:ff:ff link-netnsid 2 promiscuity 0
    veth
    vrf_slave table 20 addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
5: red: <NOARP,MASTER,UP,LOWER_UP> mtu 65536 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether f6:60:f5:4e:38:09 brd ff:ff:ff:ff:ff:ff promiscuity 0
    vrf table 10 addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
6: blu: <NOARP,MASTER,UP,LOWER_UP> mtu 65536 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether 22:a3:34:12:bc:da brd ff:ff:ff:ff:ff:ff promiscuity 0
    vrf table 20 addrgenmode eui64 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
```

You can check the routing works fine with following cli
```
watch -n0.1 docker exec R1 ip -s link
docker exec -it C1 ping 10.1.0.20 -f
```
