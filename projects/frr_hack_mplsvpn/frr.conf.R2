hostname R2
log file /tmp/frr.log
!
debug bgp vpn label
debug bgp vpn leak-from-vrf
debug bgp vpn leak-to-vrf
debug bgp vpn rmap-event
debug bgp bestpath 30.1.0.0/24
debug bgp bestpath 30.2.0.0/24
!
int net0
 ip address 10.0.0.2/24
 ipv6 address 2001::2/64
!
int net1 vrf vrf1
 ip address 30.2.0.1/24
!
router bgp 65002
 bgp router-id 10.255.0.2
 neighbor 10.0.0.1 remote-as 65001
 !
 address-family ipv4 unicast
  neighbor 10.0.0.1 activate
  redistribute connected
  redistribute static
 exit-address-family
 !
 address-family ipv4 vpn
  neighbor 10.0.0.1 activate
 exit-address-family
!
router bgp 65002 vrf vrf1
 bgp router-id 10.255.0.2
 !
 address-family ipv4 unicast
  redistribute connected
  label vpn export auto
  rd vpn export 65002:1
  rt vpn both 100:1
  export vpn
  import vpn
 exit-address-family
!
line vty
!
