
# for frr development

![](./topo.png)

references
- configure example of vpnv4 as small set.
  https://gist.github.com/hkwi/5c116f05667a3abf43c7456fae32a529

glossary
- rt: route target
- rd: route distingisher

## FRR meets SRv6 Implementation..?

```
#R1
router bgp 65001
 bgp router-id 10.255.0.1
 neighbor 2001::2 remote-as 65002
 !
 address-family ipv4 vpn
 exit-address-family
!
router bgp 65001 vrf vrf0
!
router bgp 65001 vrf vrf1
!
segment-routing srv6
 locators
  locator default
   prefix 2001:aaaa::/64
 exit-locator
 !
!

#R2
```
