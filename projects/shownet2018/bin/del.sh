#!/bin/sh
IF1=ens8f0
IF2=ens8f1

sudo ip link del $IF1.110
sudo ip link del $IF1.111
sudo ip link del $IF1.120
sudo ip link del $IF1.121
sudo ip link del $IF2.210
sudo ip link del $IF2.211
sudo ip link del $IF2.220
sudo ip link del $IF2.221

