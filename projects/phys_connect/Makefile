
init:
	sudo ip netns add ns0
	sudo ip link add port0 netns ns0 type veth peer name pp0
	sudo ip netns exec ns0 ip link set lo up
	sudo ip netns exec ns0 ip link set port0 up
	sudo ip netns exec ns0 ip addr add 10.0.0.2/24 dev port0

exit:
	sudo ip netns del ns0

