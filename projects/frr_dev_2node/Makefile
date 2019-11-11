
help:
	@echo help

build:
	make -C /home/vagrant/git/frr.slankdev
	sudo make -C /home/vagrant/git/frr.slankdev install

install:
	docker exec R1 rm -rf /usr/lib/frr
	docker cp /usr/lib/frr R1:/usr/lib/frr
	docker cp /usr/bin/vtysh R1:/usr/bin/vtysh
	\
	docker exec R2 rm -rf /usr/lib/frr
	docker cp /usr/lib/frr R2:/usr/lib/frr
	docker cp /usr/bin/vtysh R2:/usr/bin/vtysh

build_f:
	make -C /home/vagrant/git/frr.slankdev

install_f:
	docker cp /home/vagrant/git/frr.slankdev/bgpd/.libs/bgpd R1:/usr/lib/frr/bgpd
	docker cp /home/vagrant/git/frr.slankdev/vtysh/.libs/vtysh R1:/usr/bin/vtysh
	\
	docker cp /home/vagrant/git/frr.slankdev/bgpd/.libs/bgpd R2:/usr/lib/frr/bgpd
	docker cp /home/vagrant/git/frr.slankdev/vtysh/.libs/vtysh R2:/usr/bin/vtysh

config_srv6_only:
	docker cp frr.conf.srv6.R1 R1:/etc/frr/frr.conf
	docker cp frr.conf.srv6.R2 R2:/etc/frr/frr.conf

config:
	docker cp frr.conf.R1 R1:/etc/frr/frr.conf
	docker cp frr.conf.R2 R2:/etc/frr/frr.conf

stop:
	docker exec R1 /usr/lib/frr/frrinit.sh stop
	docker exec R2 /usr/lib/frr/frrinit.sh stop

start:
	docker exec R1 /usr/lib/frr/frrinit.sh start
	docker exec R2 /usr/lib/frr/frrinit.sh start

restart:
	docker exec R1 /usr/lib/frr/frrinit.sh stop
	docker exec R2 /usr/lib/frr/frrinit.sh stop
	docker exec R1 /usr/lib/frr/frrinit.sh start
	docker exec R2 /usr/lib/frr/frrinit.sh start

capture:
	docker exec R1 pkill tcpdump | true
	docker exec R2 pkill tcpdump | true
	docker exec -d R1 tcpdump -ni net0 -w /tmp/r1.pcap
	docker exec -d R2 tcpdump -ni net0 -w /tmp/r2.pcap

nocapture:
	docker exec R1 pkill tcpdump | true
	docker exec R2 pkill tcpdump | true
	docker cp R1:/tmp/r1.pcap /vagrant/r1.pcap
	docker cp R2:/tmp/r2.pcap /vagrant/r2.pcap

re:
	make -C . build_f
	make -C . install_f
	make -C . restart

rere:
	make -C . stop
	make -C . build
	make -C . install
	make -C . start

taillog:
	docker exec -it R1 touch /tmp/frr.log;
	docker exec -it R1 chown frr.frr /tmp/frr.log;
	docker exec -it R1 tail -f /tmp/frr.log -n0;

taillog_R1:
	while :; do \
		docker exec -it R1 touch /tmp/frr.log; \
		docker exec -it R1 chown frr.frr /tmp/frr.log; \
		docker exec -it R1 tail -f /tmp/frr.log -n0; \
		sleep 1 ; done
taillog_R2:
	while :; do \
		docker exec -it R2 touch /tmp/frr.log; \
		docker exec -it R2 chown frr.frr /tmp/frr.log; \
		docker exec -it R2 tail -f /tmp/frr.log -n0; \
		sleep 1 ; done

tn_reconf:
	tn reconf | sudo sh
	make -C . config_srv6_only
	make -C . rere

c:
	docker exec -it R1 vtysh -c 'conf t' \
		-c 'router bgp 65001 vrf vrf1' \
		-c 'bgp router-id 10.255.0.1' \
		-c 'address-family ipv4 unicast' \
		-c 'sid vpn export locator default' \
		-c 'rd vpn export 65001:1' \
		-c 'rt vpn both 100:1' \
		-c 'export vpn' \
		-c 'import vpn' \
		-c 'exit-address-family'

s:
	docker exec R1 ip -6 route list
	@echo
	docker exec R1 ip route list vrf vrf1
	@echo
	docker exec R1 vtysh -c 'show bgp ipv4 vpn' -c 'show segment-routing-ipv6 sid'

getcapture:
	make -C . stop
	make -C . capture
	make -C . start
	sleep 3
	make -C . nocapture

