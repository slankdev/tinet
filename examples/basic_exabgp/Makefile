
exabgp:
	exabgp ./exabgp.conf

PCAP_PATH=/vagrant
getcapture:
	tcpdump -ni net0 -w $(PCAP_PATH)/in.pcap &
	exabgp ./exabgp.conf &
	sleep 3
	killall tcpdump
	killall python3

