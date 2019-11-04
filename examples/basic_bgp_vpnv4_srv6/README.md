
# FRR meets BGP-SRv6-VPNv4

MP-BGP VPNv4 per-VRF w/ SRv6..?

![](./topo.png)

```
$ cd docker && docker build -t slankdev/fedora-frr:24 .
$ tn upconf | sudo sh
$ docker exec R1 vtysh -c 'show bgp ipv4 srv6-vpn'
```

