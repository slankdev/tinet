
# SFC Testbed

![](./img/topo.png)

NW construction and test
```
tn upconf | sudo sh
tn test remote | sudo sh
```

## DEMO1: SRv6 Encoder

![](./img/encoder.png)

blue config
```
docker exec R3 ip -6 rule add from 2001:34::10 table 10
docker exec R3 ip -6 route add 2001:12::1 encap seg6 mode inline segs fc00:5::1,fc00:2::1 dev net0 table 10
```

green config
```
docker exec R2 ip -6 route add 2001:34::10 encap seg6 mode inline segs fc00:5::1,fc00:3::1 dev net2
```

## DEMO2: SRv6 Application Proxy

![](./img/proxy.png)

blue config
```
docker exec R3 ip -6 rule add from 2001:34::10 table 10
docker exec R3 ip -6 route add 2001:12::1 encap seg6 mode inline segs fc00:6::8,fc00:2::1 dev net0 table 10
```

green config
```
docker exec R3 ip -6 rule add from 2001:34::20 table 20
docker exec R3 ip -6 route add 2001:12::1 encap seg6 mode inline segs fc00:6::8,fc00:6::9,fc00:2::1 dev net0 table 20
```

