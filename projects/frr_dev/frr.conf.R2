hostname R2
log file /tmp/frr.log
!
debug bgp vpn leak-from-vrf
!
int net0
 ipv6 address 2001::2/64
!
int net1 vrf vrf1
 ip address 20.2.0.1/24
!
int net2 vrf vrf2
 ip address 30.2.0.1/24
!
router bgp 65002
 bgp router-id 10.255.0.2
 neighbor 2001::1 remote-as 65001
 !
 address-family ipv4 unicast
  redistribute connected
 exit-address-family
 !
 address-family ipv4 vpn
  neighbor 2001::1 activate
 exit-address-family
 !
 address-family ipv4 srv6-vpn
  neighbor 2001::1 activate
 exit-address-family
!
router bgp 65002 vrf vrf0
 bgp router-id 10.255.0.2
 !
 !address-family ipv4 unicast
 ! redistribute connected
 ! label vpn export auto
 ! rd vpn export 65002:1
 ! rt vpn both 100:1
 ! export vpn
 ! import vpn
 ! export srv6-vpn
 ! import srv6-vpn
 !exit-address-family
!
line vty
!
