show_bgp_ipv4_vpn_all:
	docker exec R1 vtysh -c 'show bgp ipv4 vpn'
	@echo -e '\n===========\n'
	docker exec R2 vtysh -c 'show bgp ipv4 vpn'

show_bgp_ipv4_vpn_R1_json:
	docker exec R1 vtysh -c 'show bgp ipv4 vpn json' | jq .

show_bgp_ipv4_vpn_R2_json:
	docker exec R2 vtysh -c 'show bgp ipv4 vpn json' | jq .
