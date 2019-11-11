hostname R2
log file /tmp/frr.log
!
debug bgp vpn label
debug bgp vpn leak-from-vrf
debug bgp vpn leak-to-vrf
debug bgp vpn rmap-event
debug bgp vpn adv-prefix-sid
!
int net0
 ipv6 address 2001::2/64
!
int net1 vrf vrf1
 ip address 30.2.0.1/24
!
router bgp 65002
 bgp router-id 10.255.0.2
 neighbor 2001::1 remote-as 65001
 neighbor 2001::1 capability extended-nexthop
 !
 address-family ipv4 unicast
  redistribute connected
  redistribute static
 exit-address-family
 !
 address-family ipv4 vpn
  neighbor 2001::1 activate
	segment-routing-ipv6
 exit-address-family
!
router bgp 65002 vrf vrf1
 bgp router-id 10.255.0.2
 !
 address-family ipv4 unicast
  redistribute connected
  sid vpn export locator default
  rd vpn export 65002:1
  rt vpn both 100:1
  export vpn
  import vpn
 exit-address-family
!
segment-routing-ipv6
 encapsulation source-address 2001:2::
 locator prefix 2001:2::/64
!
line vty
!
