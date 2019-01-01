
## Portmirror Test MLX5

Logical Topo
```
+---------+            .1  10.0.0.0/24  .2
|         |port-18-0-0+--------------------+enp24s0f1[ C0 ]
|         |            .1  10.0.1.0/24  .2
| Router  |port-3b-0-0+--------------------+enp59s0f1[ C1 ]
| on slk4 |           mirror by port-18-0-0
|         |port-86-0-0+-------------------+enp134s0f1[ C2 ]
+---------+
```

Physical Topo
```
Skylake4(router)                 Skylake4(cns)
-----------------------------------------------
enp24s0f0 (pci-18:00.0)  <---->  enp24s0f1
enp59s0f0 (pci-3b:00.0)  <---->  enp59s0f1
enp134s0f0(pci-86:00.0)  <---->  enp134s0f1
```

<!-- check script -->
<!-- ``` -->
<!-- #Broadwell -->
<!-- ip link set dev ens20f0 up -->
<!-- ip link set dev ens20f1 up -->
<!-- ip link set dev ens28f0 up -->
<!-- ip link set dev ens28f1 up -->
<!-- ip addr add 10.0.1.2/24 dev ens20f0 -->
<!-- ip addr add 10.0.2.2/24 dev ens20f1 -->
<!-- ip addr add 10.0.3.2/24 dev ens28f0 -->
<!-- ip addr add 10.0.4.2/24 dev ens28f1 -->
<!--  -->
<!-- #Skylake1 -->
<!-- ip link set dev enp94s0f0 up -->
<!-- ip link set dev enp94s0f1 up -->
<!-- ip link set dev enp216s0f0 up -->
<!-- ip link set dev enp216s0f1 up -->
<!-- ip addr add 10.0.1.1/24 dev enp94s0f0 -->
<!-- ip addr add 10.0.2.1/24 dev enp94s0f1 -->
<!-- ip addr add 10.0.3.1/24 dev enp216s0f0 -->
<!-- ip addr add 10.0.4.1/24 dev enp216s0f1 -->
<!--  -->
<!-- #Skylake1 and Broadwell1 -->
<!-- ping -c2 10.0.1.1 -->
<!-- ping -c2 10.0.1.2 -->
<!-- ping -c2 10.0.2.1 -->
<!-- ping -c2 10.0.2.2 -->
<!-- ping -c2 10.0.3.1 -->
<!-- ping -c2 10.0.3.2 -->
<!-- ping -c2 10.0.4.1 -->
<!-- ping -c2 10.0.4.2 -->
<!-- ``` -->
