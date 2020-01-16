
FROM ubuntu:18.04
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# (base=ubuntu18:04) basic package install
RUN apt update \
 && apt install -y iputils-ping traceroute sudo \
    vim git tmux silversearcher-ag bash-completion \
    netcat-openbsd telnet iperf tcpdump openvswitch-switch \
		bison flex iproute2 mtr python-scapy curl pppoe pppoeconf lldpd \
		iptables ethtool \
 &&	echo "" > ~/.bashrc \
 && echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then" >> ~/.bashrc \
 && echo "  . /etc/bash_completion" >> ~/.bashrc \
 && echo "fi" >> ~/.bashrc

# (base=ubuntu18:04) install tcpdump
RUN apt update && apt -y install tcpdump \
 && mv /usr/sbin/tcpdump /usr/bin/tcpdump

# (base=ubuntu18:04) golang-1.10 install
RUN apt update \
 && apt install -y apt-file software-properties-common \
 && add-apt-repository -y ppa:gophers/archive \
 && apt update && apt install -y golang-1.10-go \
 && echo "export GOPATH=\$HOME/go" >> ~/.bashrc \
 && echo "export PATH=\$PATH:/usr/lib/go-1.10/bin" >> ~/.bashrc \
 && echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc

# (Add util)
ADD ./enable_seg6_router.py /usr/bin/enable_seg6_router.py
ADD ./disable_seg6_router.py /usr/bin/disable_seg6_router.py
RUN chmod +x /usr/bin/enable_seg6_router.py
RUN chmod +x /usr/bin/disable_seg6_router.py
