
## Quick Start

Please refer the following commands. This quick start section is
setup the basic IP network using BGP. Before starting this section,
please setup CNS basic env according **Setup and Usage** section
on [readme](README.md).

setup the virtual network.
```
$ cd cns/examples/basic_ebgp
$ cns init | sudo sh
$ cns conf | sudo sh
$ docker ps   # you can check the each network node as-a Container.
```

In this example, you setup the basic eBGP network using FRR container.
Topology is like-a following figure.

```

                             10.0.0.0/24
                     .1(net0)          .2(net0)
                R0(AS100)------------------R1(AS200)
            (net1).1|                          |.1(net1)
                    |                          |
        10.1.0.0/24 |                          | 10.2.0.0/24
                    |                          |
            (net0).2|                          |.2(net0)
                R2(AS300)                  R3(AS400)
            (net1).1|                          |.1(net1)
                    |                          |
        10.3.0.0/24 |                          | 10.4.0.0/24
                    |                          |
            (net0).2|                          |.2(net0)
                    C0                         C1

```

So, you can test to execute ping command on C0 container
with following command. This shows eBGP can advertise
network preffix to each-routers. and established ip-connection
between C0 container and C1 container.

```
$ docker exec -it C0 ping 10.4.0.2
PING 10.4.0.2 (10.4.0.2) 56(84) bytes of data.
64 bytes from 10.4.0.2: icmp_seq=1 ttl=64 time=0.169 ms
64 bytes from 10.4.0.2: icmp_seq=2 ttl=64 time=0.465 ms
...
```

finally, destroy the virtual network.
```
$ cns fini | sudo sh
```
