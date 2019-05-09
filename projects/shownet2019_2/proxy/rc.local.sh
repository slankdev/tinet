#!/bin/sh
set -ue

IF1=veth1
sudo ip link set veth1 up
sudo ip link add vlan0110 link $IF1 type vlan id 110
sudo ip link add vlan0111 link $IF1 type vlan id 111
sudo ip link add vlan0120 link $IF1 type vlan id 120
sudo ip link add vlan0121 link $IF1 type vlan id 121
sudo ip link add vlan0210 link $IF1 type vlan id 210
sudo ip link add vlan0211 link $IF1 type vlan id 211
sudo ip link add vlan0220 link $IF1 type vlan id 220
sudo ip link add vlan0221 link $IF1 type vlan id 221

sudo ip link set vlan0210 address 02:00:00:00:00:01
sudo ip link set vlan0211 address 02:00:00:00:00:02
sudo ip link set vlan0220 address 02:00:00:00:00:01
sudo ip link set vlan0221 address 02:00:00:00:00:02

sudo ip link add func1_up type vrf table 10
sudo ip link add func1_dn type vrf table 11
sudo ip link add func2_up type vrf table 20
sudo ip link add func2_dn type vrf table 21

sudo ip link set vlan0110 vrf func1_up
sudo ip link set vlan0111 vrf func1_dn
sudo ip link set vlan0210 vrf func1_up
sudo ip link set vlan0211 vrf func1_dn
sudo ip link set vlan0120 vrf func2_up
sudo ip link set vlan0121 vrf func2_dn
sudo ip link set vlan0220 vrf func2_up
sudo ip link set vlan0221 vrf func2_dn

sudo ip link set func1_up up
sudo ip link set func1_dn up
sudo ip link set func2_up up
sudo ip link set func2_dn up
sudo ip link set vlan0110 up
sudo ip link set vlan0111 up
sudo ip link set vlan0210 up
sudo ip link set vlan0211 up
sudo ip link set vlan0120 up
sudo ip link set vlan0121 up
sudo ip link set vlan0220 up
sudo ip link set vlan0221 up

sudo ip addr add cafe:110::1/64 dev vlan0110
sudo ip addr add cafe:111::1/64 dev vlan0111
sudo ip addr add cafe:120::1/64 dev vlan0120
sudo ip addr add cafe:121::1/64 dev vlan0121

sudo ip addr add cafe:210::1/64 dev vlan0210
sudo ip addr add cafe:210::2/64 dev vlan0211
sudo ip addr add cafe:220::1/64 dev vlan0220
sudo ip addr add cafe:220::2/64 dev vlan0221

sudo bird6 -c ./bird6.conf

