
CNS=../../bin/cns

all: \
	test_node_interface_physnet \
	test_node_interface_bridge \
	test_node_interface_direct

test_node_interface_physnet:
	sudo ip link add veth0 type veth peer name veth1
	sudo ip link set veth1 up
	sudo ip addr add 10.10.10.2/24 dev veth1
	$(CNS) -f test_node_interface_physnet.yaml init | sudo sh
	$(CNS) -f test_node_interface_physnet.yaml conf | sudo sh
	$(CNS) -f test_node_interface_physnet.yaml test | sudo sh
	$(CNS) -f test_node_interface_physnet.yaml fini | sudo sh

test_node_interface_bridge:
	$(CNS) -f test_node_interface_bridge.yaml init | sudo sh
	$(CNS) -f test_node_interface_bridge.yaml conf | sudo sh
	$(CNS) -f test_node_interface_bridge.yaml test | sudo sh
	$(CNS) -f test_node_interface_bridge.yaml fini | sudo sh

test_node_interface_direct:
	$(CNS) -f test_node_interface_direct.yaml init | sudo sh
	$(CNS) -f test_node_interface_direct.yaml conf | sudo sh
	$(CNS) -f test_node_interface_direct.yaml test | sudo sh
	$(CNS) -f test_node_interface_direct.yaml fini | sudo sh
