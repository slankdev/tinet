
help:
	@echo help

install:
	make -C . install_config
	make -C . install_frr

install_frr:
	docker exec R1 rm -rf /usr/lib/frr
	docker cp frr.conf.R1 R1:/etc/frr/frr.conf
	docker cp /usr/lib/frr R1:/usr/lib/frr
	docker cp /usr/bin/vtysh R1:/usr/bin/vtysh
	\
	docker exec R2 rm -rf /usr/lib/frr
	docker cp frr.conf.R2 R2:/etc/frr/frr.conf
	docker cp /usr/lib/frr R2:/usr/lib/frr
	docker cp /usr/bin/vtysh R2:/usr/bin/vtysh

install_config:
	docker cp frr.conf.R1 R1:/etc/frr/frr.conf
	docker cp frr.conf.R2 R2:/etc/frr/frr.conf

install_config_mpls_only:
	docker cp frr.conf.mpls.R1 R1:/etc/frr/frr.conf
	docker cp frr.conf.mpls.R2 R2:/etc/frr/frr.conf

install_config_srv6_only:
	docker cp frr.conf.srv6.R1 R1:/etc/frr/frr.conf
	docker cp frr.conf.srv6.R2 R2:/etc/frr/frr.conf

reload:
	docker exec R1 /usr/lib/frr/frrinit.sh restart
	docker exec R2 /usr/lib/frr/frrinit.sh restart

stop:
	docker exec R1 /usr/lib/frr/frrinit.sh stop
	docker exec R2 /usr/lib/frr/frrinit.sh stop

start:
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

rere:
	make -C /home/vagrant/git/frr.slankdev
	sudo make -C /home/vagrant/git/frr.slankdev install
	make -C . install_frr
	make -C . install_config_srv6_only
	make -C . reload

sh_bgp_sum:
	docker exec -it R1 vtysh -c 'show bgp sum'

sh_run:
	docker exec -it R1 vtysh -c 'show run'

taillog:
	docker exec -it R1 touch /tmp/frr.log
	docker exec -it R1 tail -f /tmp/frr.log -n0

