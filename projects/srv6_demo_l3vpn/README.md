
# SRv6 L3VPN Demonstration
- Hiroki Shirokura <slankdev@coe.ad.jp>
- 2018.12.30

## 概要
topologyを以下に示す.
![img](./topo.jpeg)

## セットアップ
```
$ cd tinet/projects/srv6_demo_l3vpn/
$ tn up | sudo sh # create network nodes.
$ tn conf | sudo sh # execute configuration to each nodes
$ docker ps # you can check some nodes exist.
$ tn test p2p | sudo sh # execute point-to-point link's ping.
```
