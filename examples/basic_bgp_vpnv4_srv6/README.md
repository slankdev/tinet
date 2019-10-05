
# [DRAFT] MP-BGP VPNv4 per-VRF w/ SRv6 ? (FRR meets SRv6...?)

![](./topo.png)

this is for my hobby development.
so, there are no implementation can perform MP-BGP for SRv6.
please follow @slankdev :)

setup
```
$ tn upconf | sudo sh
```

check vpn routes on R1
```
$ docker exec R1 vtysh -c 'show bgp ipv4 vpn'
```

check vrf's route on VRF1 on R1 (VPNv4 rt100:1)
```
docker exec R1 vtysh -c 'show ip route vrf vrf1'
```

