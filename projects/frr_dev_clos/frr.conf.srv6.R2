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
 ipv6 address 2001:2::1/64
!
int net1 vrf vrf1
 ip address 30.2.0.1/24
!
router bgp 65002
 bgp router-id 10.255.0.2
 neighbor 2001:2::2 remote-as 65010
 !
 address-family ipv4 unicast
  redistribute connected
  redistribute static
 exit-address-family
 !
 address-family ipv4 srv6-vpn
  neighbor 2001:2::2 activate
 exit-address-family
!
router bgp 65002 vrf vrf1
 bgp router-id 10.255.0.2
 !
 address-family ipv4 unicast
  redistribute connected
  sid srv6-vpn export 2:1::
  rd srv6-vpn export 65002:1
  rt srv6-vpn both 100:1
  export srv6-vpn
  import srv6-vpn
 exit-address-family
!
line vty
!
