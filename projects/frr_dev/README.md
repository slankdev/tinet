
# for frr development

there are only c1,c2,r1,r2 nodes.
![](./topo.png)

## FRR meets SRv6 Implementation..?

```
router bgp 65001
 bgp router-id 10.255.0.1
 neighbor 2001::2 remote-as 65002
 !
 address-family ipv4 srv6-vpnv4
 exit-address-family
!
segment-routing srv6
 locators
  locator default
   prefix 2001:aaaa::/64
 exit-locator
 !
!
```
