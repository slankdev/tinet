
echo "# H1-OSPF #"
docker exec H1 birdc6 -v show ospf nei ospf_func1_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func1_dn | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func2_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func2_dn | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func3_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func3_dn | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func4_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func4_dn | grep -v "0001 BIRD 1.6.6 ready"

echo "\n# H1 func1_up #"
docker exec H1 ip -6 route list vrf func1_up

echo "\n# H1 func1_dn #"
docker exec H1 ip -6 route list vrf func1_up

echo "\n# F1 route #"
docker exec F1 ip -6 route list
