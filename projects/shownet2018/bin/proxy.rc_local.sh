#!/bin/sh

MACHINE=1
IF1=ens8f0
IF2=ens8f1

sudo ip link add $IF1.110 link $IF1 type vlan id 110
sudo ip link add $IF1.111 link $IF1 type vlan id 111
sudo ip link add $IF1.120 link $IF1 type vlan id 120
sudo ip link add $IF1.121 link $IF1 type vlan id 121
sudo ip link add $IF2.210 link $IF2 type vlan id 210
sudo ip link add $IF2.211 link $IF2 type vlan id 211
sudo ip link add $IF2.220 link $IF2 type vlan id 220
sudo ip link add $IF2.221 link $IF2 type vlan id 221

sudo ip link add func1_up type vrf table 10
sudo ip link add func1_dn type vrf table 11
sudo ip link add func2_up type vrf table 20
sudo ip link add func2_dn type vrf table 21
sudo ip link set func1_up up
sudo ip link set func1_dn up
sudo ip link set func2_up up
sudo ip link set func2_dn up

sudo ip link set dev $IF1.110 vrf func1_up
sudo ip link set dev $IF1.111 vrf func1_dn
sudo ip link set dev $IF1.120 vrf func2_up
sudo ip link set dev $IF1.121 vrf func2_dn
sudo ip link set dev $IF2.210 vrf func1_up
sudo ip link set dev $IF2.211 vrf func1_dn
sudo ip link set dev $IF2.220 vrf func2_up
sudo ip link set dev $IF2.221 vrf func2_dn

sudo ip link set $IF1 up
sudo ip link set $IF2 up
sudo ip link set dev $IF1.110 up
sudo ip link set dev $IF1.111 up
sudo ip link set dev $IF1.120 up
sudo ip link set dev $IF1.121 up
sudo ip link set dev $IF2.210 up
sudo ip link set dev $IF2.211 up
sudo ip link set dev $IF2.220 up
sudo ip link set dev $IF2.221 up

sudo ip addr add cafe:110::$MACHINE/64 dev $IF1.110
sudo ip addr add cafe:111::$MACHINE/64 dev $IF1.111
sudo ip addr add cafe:120::$MACHINE/64 dev $IF1.120
sudo ip addr add cafe:121::$MACHINE/64 dev $IF1.121
sudo ip addr add cafe:210::$MACHINE/64 dev $IF2.210
sudo ip addr add cafe:211::$MACHINE/64 dev $IF2.211
sudo ip addr add cafe:220::1/64 dev $IF2.220
sudo ip addr add cafe:220::2/64 dev $IF2.221

sudo ip link set dev $IF2.220 address 52:54:00:97:32:11
sudo ip link set dev $IF2.221 address 52:54:00:97:32:22
sudo ip addr replace fe00::1/64 dev $IF2.220
sudo ip addr replace fe00::2/64 dev $IF2.221
