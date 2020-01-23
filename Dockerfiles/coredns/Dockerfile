
FROM slankdev/frr:centos-7-stable-7.0
MAINTAINER Hiroki Shirokura <slankdev@gmail.com>

ADD https://github.com/coredns/coredns/releases/download/v1.6.6/coredns_1.6.6_linux_amd64.tgz /tmp
RUN yum -y install bind-utils \
 && cd /tmp && tar xpf coredns_1.6.6_linux_amd64.tgz && mv coredns /usr/bin/coredns \
 && bash -c 'echo -e ".:53 {\n  errors\n  log\n  forward . 8.8.8.8\n}" > /Corefile'
