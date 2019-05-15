#!/bin/sh

docker exec H1 ip nei flush dev to_user
docker exec H1 ip nei flush dev to_inet
docker exec H1 ip nei flush dev vlan0110
docker exec H1 ip nei flush dev vlan0111
docker exec H1 ip nei flush dev vlan0120
docker exec H1 ip nei flush dev vlan0121
docker exec H1 ip nei flush dev vlan0130
docker exec H1 ip nei flush dev vlan0131
docker exec H1 ip nei flush dev vlan0140
docker exec H1 ip nei flush dev vlan0141

docker exec F1 ip nei flush dev net0
docker exec F1 ip nei flush dev net1

docker exec F2 ip nei flush dev net0
docker exec F2 ip nei flush dev net1
