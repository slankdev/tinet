
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
	docker exec R1 /usr/lib/frr/frrinit.sh restart
	docker exec R2 /usr/lib/frr/frrinit.sh restart

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
	make -C . build
	make -C . install
	make -C . restart

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
	make -C . install
	make -C . config_srv6_only

