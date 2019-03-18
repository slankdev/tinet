
# SRv6 multi VRF SFC

![](./topo.png)

- the tmp image should include **bird-1.6.6**
- also kernel's version can be perform l3mdev

**R3 CLI config**
```
#!/bin/sh

sudo ip link add ens8f0.10 link ens8f0 type vlan id 10
sudo ip link add ens8f0.11 link ens8f0 type vlan id 11
sudo ip link add ens8f0.12 link ens8f0 type vlan id 12
sudo ip link add ens8f0.13 link ens8f0 type vlan id 13

sudo ip link add red type vrf table 10
sudo ip link add blu type vrf table 20
sudo ip link set red up
sudo ip link set blu up

sudo ip link add lo.red type dummy
sudo ip link add lo.blu type dummy
sudo ip link set lo.red vrf red
sudo ip link set lo.blu vrf blu

sudo ip link set ens8f0.10 vrf red
sudo ip link set ens8f0.11 vrf blu
sudo ip link set ens8f0.12 vrf red
sudo ip link set ens8f0.13 vrf blu

sudo ip link set ens8f0.10 up
sudo ip link set ens8f0.11 up
sudo ip link set ens8f0.12 up
sudo ip link set ens8f0.13 up
sudo ip link set lo.red up
sudo ip link set lo.blu up

sudo ip -6 addr add 2001:111::1/64 dev ens8f0.10
sudo ip -6 addr add 2001:222::1/64 dev ens8f0.11
sudo ip -6 addr add 2001:f10::1/64 dev ens8f0.12
sudo ip -6 addr add 2001:f11::1/64 dev ens8f0.13
sudo ip -6 addr add f10::1/64 dev lo.red
sudo ip -6 addr add f11::1/64 dev lo.blu

sudo srconf localsid add f10::10 end.am ip 2001:f10::2 ens8f0.12 ens8f0.13
sudo srconf localsid add f11::10 end.am ip 2001:f11::2 ens8f0.13 ens8f0.12

sudo systemctl restart bird6
```

