
all:
	bird6 -p -c H1_bird6.conf
	docker cp H1_bird6.conf H1:/root/bird6.conf
	docker exec H1 killall bird6
	docker exec H1 bird6 -c /root/bird6.conf
