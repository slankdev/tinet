
FRR_DIR = /home/vagrant/git/frr.slankdev

help:
	@echo help

install:
	docker cp $(FRR_DIR)/bgpd/.libs/bgpd   R1:/usr/lib/frr/bgpd
	docker cp $(FRR_DIR)/zebra/.libs/zebra R1:/usr/lib/frr/zebra
	docker cp $(FRR_DIR)/vtysh/.libs/vtysh R1:/usr/bin/vtysh
	docker cp $(FRR_DIR)/bgpd/.libs/bgpd   R2:/usr/lib/frr/bgpd
	docker cp $(FRR_DIR)/zebra/.libs/zebra R2:/usr/lib/frr/zebra
	docker cp $(FRR_DIR)/vtysh/.libs/vtysh R2:/usr/bin/vtysh
