
## Portmirror Test

Logical Topo
```
+---------+            .1  10.0.0.0/24  .2
|         |port-5e-0-0+-------------------+enp20f0[ C0 ]
|         |            .1  10.0.1.0/24  .2
| Router  |port-5e-0-1+-------------------+enp20f1[ C1 ]
| on slk1 |           mirror by port-5e-0-0
|         |port-d8-0-0+-------------------+enp28f0[ C2 ]
+---------+
```

Physical Topo
```
Skylake1                         Broadwell1
--------------------------------------------
enp94s0f0 (pci-5e:00.0)  <---->  ens20f0
enp94s0f1 (pci-5e:00.1)  <---->  ens20f1
enp216s0f0(pci-d8:00.0)  <---->  ens28f0
enp216s0f1(pci-d8:00.1)  <---->  ens28f1
```

check script
```
#Broadwell1
ip link set dev ens20f0 up
ip link set dev ens20f1 up
ip link set dev ens28f0 up
ip link set dev ens28f1 up
ip addr add 10.0.1.2/24 dev ens20f0
ip addr add 10.0.2.2/24 dev ens20f1
ip addr add 10.0.3.2/24 dev ens28f0
ip addr add 10.0.4.2/24 dev ens28f1

#Skylake1
ip link set dev enp94s0f0 up
ip link set dev enp94s0f1 up
ip link set dev enp216s0f0 up
ip link set dev enp216s0f1 up
ip addr add 10.0.1.1/24 dev enp94s0f0
ip addr add 10.0.2.1/24 dev enp94s0f1
ip addr add 10.0.3.1/24 dev enp216s0f0
ip addr add 10.0.4.1/24 dev enp216s0f1

#Skylake1 and Broadwell1
ping -c2 10.0.1.1
ping -c2 10.0.1.2
ping -c2 10.0.2.1
ping -c2 10.0.2.2
ping -c2 10.0.3.1
ping -c2 10.0.3.2
ping -c2 10.0.4.1
ping -c2 10.0.4.2
```
