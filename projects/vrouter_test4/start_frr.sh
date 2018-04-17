#!/bin/sh
NAME=tmp

docker run -td --rm \
	--privileged --net=host --name=$NAME \
	slankdev/frr
sleep 3
docker exec -it $NAME \
				vtysh -c 'conf t' \
          -c 'interface port-0-6-0' \
          -c ' ip address 10.0.0.1/24' \
          -c ' ipv6 nd suppress-ra' \
          -c ' no link-detect' \
          -c 'exit' \
          -c 'interface port-0-7-0' \
          -c ' ip address 10.0.1.1/24' \
          -c ' ipv6 nd suppress-ra' \
          -c ' no link-detect' \
          -c 'exit' \
