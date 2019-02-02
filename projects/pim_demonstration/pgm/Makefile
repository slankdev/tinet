
CC=gcc

all:
	$(CC) -o sender.out sender.c
	$(CC) -o recver.out recver.c

clean:
	rm -f *.o *.out

install: all
	docker cp recver.out R1:/usr/bin/
	docker cp recver.out R2:/usr/bin/
	docker cp recver.out R3:/usr/bin/
	docker cp recver.out R4:/usr/bin/
	docker cp recver.out R5:/usr/bin/
	docker cp sender.out R1:/usr/bin/
	docker cp sender.out R2:/usr/bin/
	docker cp sender.out R3:/usr/bin/
	docker cp sender.out R4:/usr/bin/
	docker cp sender.out R5:/usr/bin/

