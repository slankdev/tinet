

# FROM slankdev/ubuntu:18.10
FROM slankdev/sandbox
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# (base=slankdev/ubuntu18:10) Bird
# RUN apt update && apt install -y bird
WORKDIR /tmp/
RUN apt update && apt install -y libncurses-dev libreadline-dev wget \
 && wget ftp://bird.network.cz/pub/bird/bird-1.6.6.tar.gz \
 && tar xpf /tmp/bird-*.tar.gz && cd /tmp/bird* \
 && ./configure --enable-ipv6=yes && make && make install
