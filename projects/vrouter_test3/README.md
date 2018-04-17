
# Usage

```
init:
	cns -f spec.yaml init | sudo sh
	cns -f dut.yaml init | sudo sh
	sudo ip link set ovs0 up

fini:
	cns -f spec.yaml fini | sudo sh
	cns -f dut.yaml fini | sudo sh

conf:
	cns -f spec.yaml conf | sudo sh
	cns -f dut.yaml conf | sudo sh
```

