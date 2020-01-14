
# Managed NAPT example

```
tn upconf | sudo sh
docker exec S1 python3 -m http.server 80 >/dev/null &
docker exec S1 tcpdump -ni net0 -Qin '(tcp[tcpflags] & tcp-syn)' != 0 &
docker exec C1 curl --interface 10.0.0.2 20.0.0.2
docker exec C1 curl --interface 10.0.0.3 20.0.0.2
docker exec C1 curl --interface 10.0.0.4 20.0.0.2
```
