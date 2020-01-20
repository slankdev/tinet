
FROM centos:centos7
MAINTAINER Hiroki Shirokura <slankdev@gmail.com>

RUN yum install git autoconf automake libtool make \
  readline-devel texinfo net-snmp-devel groff pkgconfig \
  json-c-devel pam-devel bison flex pytest c-ares-devel \
  python-devel systemd-devel python-sphinx libcap-devel \
	sudo iproute traceroute iputils bash-completion tcpdump \
	wireshark gdb wget vim libunwind libunwind-devel \
	iptables-services

ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-debuginfo-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-devel-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-0.16.111-0.src.rpm /tmp

ADD ./enable_seg6_router.py /usr/bin/enable_seg6_router.py
ADD ./disable_seg6_router.py /usr/bin/disable_seg6_router.py
RUN chmod +x /usr/bin/enable_seg6_router.py
RUN chmod +x /usr/bin/disable_seg6_router.py

