#!/bin/sh
sudo ip link del vlan0110
sudo ip link del vlan0111
sudo ip link del vlan0210
sudo ip link del vlan0211
sudo ip link del vlan0120
sudo ip link del vlan0121
sudo ip link del vlan0220
sudo ip link del vlan0221

sudo ip link del func1_up
sudo ip link del func1_dn
sudo ip link del func2_up
sudo ip link del func2_dn

sudo killall bird6
exit 0
