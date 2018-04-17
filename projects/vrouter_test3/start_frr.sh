#!/bin/sh
NAME=tmp

docker run -td --rm \
	--privileged --net=host --name=$NAME \
	slankdev/frr
sleep 3
docker exec -it $NAME \
				vtysh -c 'conf t' \
          -c 'interface lo' \
          -c '  ip address 4.4.4.4/32' \
          -c 'exit' \
          -c 'interface port-0-6-0' \
          -c ' ip address 10.2.0.2/24' \
          -c ' ipv6 nd suppress-ra' \
          -c ' no link-detect' \
          -c 'exit' \
          -c 'interface port-0-7-0' \
          -c ' ip address 10.3.0.2/24' \
          -c ' ipv6 nd suppress-ra' \
          -c ' no link-detect' \
          -c 'exit' \
          -c 'interface port-0-8-0' \
          -c ' ip address 192.168.20.1/24' \
          -c ' ipv6 nd suppress-ra' \
          -c ' no link-detect' \
          -c 'exit' \
          -c 'router ospf' \
          -c '  network 10.2.0.0/24 area 0' \
          -c '  network 10.3.0.0/24 area 0' \
          -c '  network 4.4.4.4/32 area 0' \
          -c 'exit' \
          -c 'router bgp 100' \
          -c ' bgp router-id 4.4.4.4' \
          -c ' neighbor 1.1.1.1 remote-as 100' \
          -c ' neighbor 1.1.1.1 update-source lo' \
          -c ' neighbor 2.2.2.2 remote-as 100' \
          -c ' neighbor 2.2.2.2 update-source lo' \
          -c ' neighbor 3.3.3.3 remote-as 100' \
          -c ' neighbor 3.3.3.3 update-source lo' \
          -c ' network 192.168.20.0/24' \
          -c 'exit'
