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
sudo ip link add vlan0130 link $IF1 type vlan id 130
sudo ip link add vlan0131 link $IF1 type vlan id 131
sudo ip link add vlan0140 link $IF1 type vlan id 140
sudo ip link add vlan0141 link $IF1 type vlan id 141
sudo ip link add vlan0230 link $IF1 type vlan id 230
sudo ip link add vlan0231 link $IF1 type vlan id 231
sudo ip link add vlan0240 link $IF1 type vlan id 240
sudo ip link add vlan0241 link $IF1 type vlan id 241

sudo ip link set vlan0210 address 02:00:00:00:00:01
sudo ip link set vlan0211 address 02:00:00:00:00:02
sudo ip link set vlan0220 address 02:00:00:00:00:01
sudo ip link set vlan0221 address 02:00:00:00:00:02
sudo ip link set vlan0230 address 02:00:00:00:00:01
sudo ip link set vlan0231 address 02:00:00:00:00:02
sudo ip link set vlan0240 address 02:00:00:00:00:01
sudo ip link set vlan0241 address 02:00:00:00:00:02

sudo ip link add func1_up type vrf table 10
sudo ip link add func1_dn type vrf table 11
sudo ip link add func2_up type vrf table 20
sudo ip link add func2_dn type vrf table 21
sudo ip link add func3_up type vrf table 30
sudo ip link add func3_dn type vrf table 31
sudo ip link add func4_up type vrf table 40
sudo ip link add func4_dn type vrf table 41

sudo ip link set vlan0110 vrf func1_up
sudo ip link set vlan0111 vrf func1_dn
sudo ip link set vlan0210 vrf func1_up
sudo ip link set vlan0211 vrf func1_dn
sudo ip link set vlan0120 vrf func2_up
sudo ip link set vlan0121 vrf func2_dn
sudo ip link set vlan0220 vrf func2_up
sudo ip link set vlan0221 vrf func2_dn
sudo ip link set vlan0130 vrf func3_up
sudo ip link set vlan0131 vrf func3_dn
sudo ip link set vlan0230 vrf func3_up
sudo ip link set vlan0231 vrf func3_dn
sudo ip link set vlan0140 vrf func4_up
sudo ip link set vlan0141 vrf func4_dn
sudo ip link set vlan0240 vrf func4_up
sudo ip link set vlan0241 vrf func4_dn

sudo ip link set func1_up up
sudo ip link set func1_dn up
sudo ip link set func2_up up
sudo ip link set func2_dn up
sudo ip link set func3_up up
sudo ip link set func3_dn up
sudo ip link set func4_up up
sudo ip link set func4_dn up
sudo ip link set vlan0110 up
sudo ip link set vlan0111 up
sudo ip link set vlan0210 up
sudo ip link set vlan0211 up
sudo ip link set vlan0120 up
sudo ip link set vlan0121 up
sudo ip link set vlan0220 up
sudo ip link set vlan0221 up
sudo ip link set vlan0130 up
sudo ip link set vlan0131 up
sudo ip link set vlan0230 up
sudo ip link set vlan0231 up
sudo ip link set vlan0140 up
sudo ip link set vlan0141 up
sudo ip link set vlan0240 up
sudo ip link set vlan0241 up

sudo ip addr add cafe:110::1/64 dev vlan0110
sudo ip addr add cafe:111::1/64 dev vlan0111
sudo ip addr add cafe:120::1/64 dev vlan0120
sudo ip addr add cafe:121::1/64 dev vlan0121
sudo ip addr add cafe:130::1/64 dev vlan0130
sudo ip addr add cafe:131::1/64 dev vlan0131
sudo ip addr add cafe:140::1/64 dev vlan0140
sudo ip addr add cafe:141::1/64 dev vlan0141

sudo ip addr add cafe:210::1/64 dev vlan0210
sudo ip addr add cafe:210::2/64 dev vlan0211
sudo ip addr add cafe:220::1/64 dev vlan0220
sudo ip addr add cafe:220::2/64 dev vlan0221
sudo ip addr add cafe:230::1/64 dev vlan0230
sudo ip addr add cafe:230::2/64 dev vlan0231
sudo ip addr add cafe:240::1/64 dev vlan0240
sudo ip addr add cafe:240::2/64 dev vlan0241

sudo bird6 -c ./bird6.conf

