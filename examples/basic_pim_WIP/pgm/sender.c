#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

int
main()
{
 int sock;
 struct sockaddr_in addr;
 in_addr_t ipaddr;

 sock = socket(AF_INET, SOCK_DGRAM, 0);
 addr.sin_family = AF_INET;
 addr.sin_port = htons(12345);
 addr.sin_addr.s_addr = inet_addr("239.1.1.5");

 ipaddr = inet_addr("127.0.0.1");
 if (setsockopt(sock,
		IPPROTO_IP,
		IP_MULTICAST_IF,
		(char *)&ipaddr, sizeof(ipaddr)) != 0) {
	perror("setsockopt");
	return 1;
 }

 while (1) {
   sendto(sock, "HELLO", 5, 0, (struct sockaddr *)&addr, sizeof(addr));
   printf("send\n");
   sleep(1);
 }
 close(sock);
 return 0;
}
