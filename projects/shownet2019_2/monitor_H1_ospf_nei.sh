
docker exec H1 birdc6 -v show ospf nei ospf_func1_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func1_dn | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func2_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func2_dn | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func3_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func3_dn | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func4_up | grep -v "0001 BIRD 1.6.6 ready"
docker exec H1 birdc6 -v show ospf nei ospf_func4_dn | grep -v "0001 BIRD 1.6.6 ready"

