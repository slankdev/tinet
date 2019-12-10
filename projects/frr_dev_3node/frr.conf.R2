hostname R2
log file /tmp/frr.log
!
!debug bgp vpn label
!debug bgp vpn leak-from-vrf
!debug bgp vpn leak-to-vrf
!debug bgp vpn rmap-event
!debug bgp vpn adv-prefix-sid
!
int net0
 ipv6 nd ra-interval 1
 no ipv6 nd suppress-ra
!
int net1 vrf vrf1
 ip address 30.2.0.1/24
!
router bgp 2
 bgp router-id 2.0.0.0
 no bgp default ipv4-unicast
 bgp bestpath as-path multipath-relax
 neighbor FAB peer-group
 neighbor FAB remote-as external
 neighbor FAB capability extended-nexthop
 neighbor net0 interface peer-group FAB
 !
 address-family ipv6 unicast
  neighbor FAB activate
  network 2001:2::/64
 exit-address-family
 !
 address-family ipv4 vpn
  neighbor FAB activate
  segment-routing-ipv6
 exit-address-family
!
router bgp 2 vrf vrf1
 bgp router-id 2.0.0.0
 !
 address-family ipv4 unicast
  redistribute connected
  sid vpn export locator default
  rd vpn export 2:1
  rt vpn both 100:1
  export vpn
  import vpn
 exit-address-family
!
ip prefix-list P seq 1 permit 169.254.1.0/24
ip prefix-list P seq 2 permit 169.254.2.0/24
ip prefix-list P seq 3 permit 169.254.3.0/24
!
segment-routing-ipv6
 encapsulation source-address 2001:2::
 locator prefix 2001:2::/64
 pseudo-dt4-dummy-ip P
!
line vty
!
