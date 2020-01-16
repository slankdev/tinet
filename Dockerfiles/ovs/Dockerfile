
FROM slankdev/ubuntu:18.04
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# (base=slankdev/ubuntu18:04) ovs preparation
CMD \
	mkdir -p /etc/openvswitch && \
	mkdir -p /var/run/openvswitch && \
  ovsdb-tool create \
		/etc/openvswitch/conf.db \
		/usr/share/openvswitch/vswitch.ovsschema && \
	ovsdb-server \
		--remote=punix:/var/run/openvswitch/db.sock \
		--remote=db:Open_vSwitch,Open_vSwitch,manager_options \
		--pidfile --detach && \
	ovs-vsctl --no-wait init && \
	ovs-vswitchd unix:/var/run/openvswitch/db.sock --pidfile
