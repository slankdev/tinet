
FROM slankdev/frr:centos-7-stable-7.0
MAINTAINER Hiroki Shirokura <slankdev@gmail.com>

RUN yum install -y conntrack-tools keepalived nc

ADD https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.4.0.tar.gz /tmp/iproute2-5.4.0.tar.gz
RUN cd /tmp && tar xpf iproute2-5.4.0.tar.gz && cd iproute2-5.4.0 && ./configure && make -j8 && make install
