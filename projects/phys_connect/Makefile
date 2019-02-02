
init:
	sudo ip netns add ns0
	sudo ip link add port0 netns ns0 type veth peer name pp0
	sudo ip link add port1 netns ns0 type veth peer name pp1

exit:
	sudo ip netns del ns0

