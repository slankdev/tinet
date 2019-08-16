
all:
	bird6 -p -c H1_bird6.conf
	docker cp H1_bird6.conf H1:/root/bird6.conf
	docker exec H1 sh -c "killall bird6 || true"
	docker exec H1 bird6 -c /root/bird6.conf
