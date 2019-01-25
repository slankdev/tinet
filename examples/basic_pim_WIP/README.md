
# PIM Multicast Test

![](topo.jpeg)

**R3**: configure as RP (Rendezvous Point)
```
conf t
 int lo
  ip igmp
	ip pim sm
 ip pim rp 10.255.0.3
```

**R6**: configure as FHR (First Hop Router)
```
```

**R5**: configure as LHR (Last Hop Router)
```
```

debug commands (vtysh)
```
show ip mroute
show ip pim neighbor
show ip pim join
show ip pim state
show ip pim rp-info
show ip pim interface
```

