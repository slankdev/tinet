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
	#end

RUN git clone https://github.com/FRRouting/frr /frr && cd /frr && ./bootstrap.sh \
 && sudo groupadd -g 92 frr && sudo groupadd -r -g 85 frrvty \
 && sudo useradd -u 92 -g 92 -M -r -G frrvty -s /sbin/nologin \
				-c "FRR FRRouting suite" -d /var/run/frr frr \
 && ./configure \
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
 && sudo mkdir -p /var/log/frr && sudo mkdir -p /etc/frr \
 && sudo touch /etc/frr/frr.conf && sudo touch /etc/frr/vtysh.conf \
 && sudo chown -R frr:frr /etc/frr/ \
 && sudo chown frr:frrvty /etc/frr/vtysh.conf \
 && sudo chmod 640 /etc/frr/*.conf \
 && sudo install -p -m -644 tools/etc/frr/daemons /etc/frr \
 && sudo chown frr:frr /etc/frr/daemons \
 && cd /frr && make -j8 && make install
