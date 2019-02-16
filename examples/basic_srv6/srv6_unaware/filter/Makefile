
CONTAINER = F1

def: clean all apply_filter

all:
	clang -O2 -Wall -target bpf -c filter_net0.c
	clang -O2 -Wall -target bpf -c filter_net1.c
	docker exec $(CONTAINER) mkdir -p /filter
	docker cp filter_net0.o $(CONTAINER):/filter/net0
	docker cp filter_net1.o $(CONTAINER):/filter/net1
	docker exec $(CONTAINER) ls /filter

clean:
	rm -f *.o

apply_filter: reset_filter
	docker exec $(CONTAINER) ip link set net0 xdp obj /filter/net0
	docker exec $(CONTAINER) ip link set net1 xdp obj /filter/net1

reset_filter:
	docker exec $(CONTAINER) ip link set net0 xdp off
	docker exec $(CONTAINER) ip link set net1 xdp off

