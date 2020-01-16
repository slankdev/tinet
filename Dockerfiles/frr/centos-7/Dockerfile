
FROM centos:centos7
MAINTAINER Hiroki Shirokura <slankdev@gmail.com>

RUN yum install -y git autoconf automake libtool make \
  readline-devel texinfo net-snmp-devel groff pkgconfig \
  json-c-devel pam-devel bison flex pytest c-ares-devel \
  python-devel systemd-devel python-sphinx libcap-devel \
	sudo iproute traceroute iputils bash-completion tcpdump \
	wireshark gdb wget vim libunwind libunwind-devel \
	iptables-services \
	https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-0.16.111-0.x86_64.rpm \
	https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-debuginfo-0.16.111-0.x86_64.rpm \
	https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-devel-0.16.111-0.x86_64.rpm \
	https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/CentOS-7-x86_64-Packages/libyang-0.16.111-0.src.rpm 

ADD ./enable_seg6_router.py /usr/bin/enable_seg6_router.py
ADD ./disable_seg6_router.py /usr/bin/disable_seg6_router.py
RUN chmod +x /usr/bin/enable_seg6_router.py
RUN chmod +x /usr/bin/disable_seg6_router.py

RUN groupadd -g 92 frr \
 && groupadd -r -g 85 frrvty \
 && useradd -u 92 -g 92 -M -r -G frrvty -s /sbin/nologin -c "FRR FRRouting suite" -d /var/run/frr frr
RUN git clone -b stable/7.0 https://github.com/frrouting/frr.git /root/frr \
 && cd /root/frr && ./bootstrap.sh && ./configure \
			--prefix=/usr --includedir=\${prefix}/include \
			--enable-exampledir=\${prefix}/share/doc/frr/examples \
			--bindir=\${prefix}/bin --sbindir=\${prefix}/lib/frr \
			--libdir=\${prefix}/lib/frr --libexecdir=\${prefix}/lib/frr \
			--localstatedir=/var/run/frr --sysconfdir=/etc/frr \
			--with-moduledir=\${prefix}/lib/frr/modules \
			--with-libyang-pluginsdir=\${prefix}/lib/frr/libyang_plugins \
			--enable-configfile-mask=0640 --enable-logfile-mask=0640 \
			--enable-multipath=64 --enable-user=frr \
			--enable-group=frr --enable-vty-group=frrvty --with-pkg-git-version \
			--disable-ripd --disable-ripngd --disable-ospfd --disable-ospf6d \
			--disable-ldpd --disable-nhrpd --disable-eigrpd --disable-babeld \
			--disable-isisd --disable-pimd --disable-pbrd --disable-fabricd \
			--disable-vrrpd --disable-doc \
 && make -j8 && make install
RUN mkdir /var/log/frr \
 && mkdir /etc/frr \
 && touch /etc/frr/frr.conf \
 && chown -R frr:frr /etc/frr/ \
 && touch /etc/frr/vtysh.conf \
 && chown frr:frrvty /etc/frr/vtysh.conf \
 && chmod 640 /etc/frr/*.conf \
 && install -p -m 644 /root/frr/tools/etc/frr/daemons /etc/frr \
 && chown frr:frr /etc/frr/daemons

RUN sed -i -e 's/bgpd=no/bgpd=yes/' /etc/frr/daemons
