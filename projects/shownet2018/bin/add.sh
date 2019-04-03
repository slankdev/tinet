#!/bin/sh

if [ $# -ne 1 ]; then
	echo "invalid command syntax" 1>&2
	echo "Usage: $0 <machine-id>" 1>&2
	exit 1
fi

MACHINE=$1
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

sudo ip addr add 10.110.0.$MACHINE/24 dev $IF1.110
sudo ip addr add 10.111.0.$MACHINE/24 dev $IF1.111
sudo ip addr add 10.120.0.$MACHINE/24 dev $IF1.120
sudo ip addr add 10.121.0.$MACHINE/24 dev $IF1.121
sudo ip addr add 10.210.0.$MACHINE/24 dev $IF2.210
sudo ip addr add 10.211.0.$MACHINE/24 dev $IF2.211
sudo ip addr add 10.220.0.$MACHINE/24 dev $IF2.220
sudo ip addr add 10.221.0.$MACHINE/24 dev $IF2.221

sudo ip addr add cafe:110::$MACHINE/64 dev $IF1.110
sudo ip addr add cafe:111::$MACHINE/64 dev $IF1.111
sudo ip addr add cafe:120::$MACHINE/64 dev $IF1.120
sudo ip addr add cafe:121::$MACHINE/64 dev $IF1.121
sudo ip addr add cafe:210::$MACHINE/64 dev $IF2.210
sudo ip addr add cafe:211::$MACHINE/64 dev $IF2.211
sudo ip addr add cafe:220::$MACHINE/64 dev $IF2.220
sudo ip addr add cafe:221::$MACHINE/64 dev $IF2.221
