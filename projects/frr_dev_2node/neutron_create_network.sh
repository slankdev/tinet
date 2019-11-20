#!/bin/sh
set -ue

if [ $# -ne 2 ]; then
	echo "invalid command syntax" 1>&2
	echo "Usage: $0 <container-name> <new-id>" 1>&2
	exit 1
fi

CNAME=$1
ID=$2

docker exec $CNAME ip link add vrf$ID type vrf table $ID
docker exec $CNAME ip link set vrf$ID up
docker exec $CNAME ip route add 169.254.99.$ID dev vrf$ID
docker exec $CNAME ip link add net$ID type dummy
docker exec $CNAME ip link set net$ID vrf vrf$ID
docker exec $CNAME ip link set net$ID up
docker exec $CNAME ip addr add 40.$ID.0.1/24 dev net$ID
docker exec $CNAME vtysh -c "conf t" \
	-c "router bgp 65001 vrf vrf$ID" \
	-c "address-family ipv4 unicast" \
	-c " redistribute connected" \
	-c " sid vpn export locator default" \
	-c " rd vpn export 65001:$ID" \
	-c " rt vpn both 100:$ID" \
	-c " export vpn" \
	-c " import vpn"

