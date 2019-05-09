
echo -n 'R1 '
docker exec R1 vtysh -c 'show ipv6 ospf6 nei'

echo
echo -n 'R2 '
docker exec R2 vtysh -c 'show ipv6 ospf6 nei'

echo
echo -n 'R3 '
docker exec R3 vtysh -c 'show ipv6 ospf6 nei'

echo
echo -n 'R4 '
docker exec R4 vtysh -c 'show ipv6 ospf6 nei'

echo
echo -n 'F1 '
docker exec F1 vtysh -c 'show ipv6 ospf6 nei'

