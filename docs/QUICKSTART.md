
## Quick Start

Please refer to the following commands. This quick start guide is
to setup the basic IP network using BGP. Before starting this section,
please setup the TiNet basic environment according to the
**Setup and Usage** section in [readme](../README.md).

setup the virtual network.
```
$ cd tinet/examples/basic_ebgp
$ tn up | sudo sh
$ tn conf | sudo sh
$ docker ps   # you can check the each network node as-a Container.
```

In this example, you can setup the basic eBGP network using FRR container.
The topology is depicted in the following figure.

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

You can execute the ping command on C0 container
with the following command. It shows that in the eBGP configuration
you can advertise the network prefix to each routers, and
successfully established the IP reachability
between C0 container and C1 container.

```
$ docker exec -it C0 ping 10.4.0.2
PING 10.4.0.2 (10.4.0.2) 56(84) bytes of data.
64 bytes from 10.4.0.2: icmp_seq=1 ttl=64 time=0.169 ms
64 bytes from 10.4.0.2: icmp_seq=2 ttl=64 time=0.465 ms
...
```

When you finish, you can destroy the virtual network by the
following command.
```
$ tn down | sudo sh
```

More infomation is written at [yaml-spec](specification_yml.md),
and [cli-spec](specification_cli.md). If you have any question,
please open new issue. Thanks.
