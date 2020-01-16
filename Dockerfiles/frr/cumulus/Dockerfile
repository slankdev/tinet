
FROM cumulusnetworks/frrouting:latest
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# (base=ubuntu16:04) basic package install
RUN apt update \
 && apt install -y iputils-ping traceroute sudo \
    vim git tmux silversearcher-ag bash-completion \
    netcat-openbsd telnet iperf tcpdump openvswitch-switch \
		bison flex ipvsadm keepalived python-scapy \
 &&	echo "" > ~/.bashrc \
 && echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then" >> ~/.bashrc \
 && echo "  . /etc/bash_completion" >> ~/.bashrc \
 && echo "fi" >> ~/.bashrc

# (base=ubuntu16:04) install tcpdump
RUN apt update && apt -y install tcpdump \
 && mv /usr/sbin/tcpdump /usr/bin/tcpdump

# (base=ubuntu16:04) golang-1.10 install
RUN apt update \
 && apt install -y apt-file software-properties-common \
 && add-apt-repository -y ppa:gophers/archive \
 && apt update && apt install -y golang-1.10-go \
 && echo "export GOPATH=\$HOME/go" >> ~/.bashrc \
 && echo "export PATH=\$PATH:/usr/lib/go-1.10/bin" >> ~/.bashrc \
 && echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc

# (base=golang-1.10) openconfigd & frrd install
RUN apt update && apt install -y automake \
 && export PATH=$PATH:/usr/lib/go-1.10/bin \
 && export GOPATH=$HOME/go \
 && go get -v github.com/coreswitch/openconfigd/openconfigd \
 && cd $GOPATH/src/github.com/coreswitch/openconfigd/openconfigd \
 && git checkout -b v0.8.1 refs/tags/v0.8.1 && go install \
 && go get -v github.com/coreswitch/openconfigd/cli_command \
 && cd $GOPATH/src/github.com/coreswitch/openconfigd/cli \
 && ./configure && make && sudo make install \
 && cd $GOPATH/src/github.com/coreswitch/openconfigd/ \
 && cp bash_completion.d/cli /etc/bash_completion.d/ \
 && go get -v github.com/slankdev/frr/frrd

RUN git clone git://git.kernel.org/pub/scm/network/iproute2/iproute2.git \
 && cd iproute2 && ./configure && make && make install

