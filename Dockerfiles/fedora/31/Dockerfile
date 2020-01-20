
FROM fedora:31
MAINTAINER Hiroki Shirokura <slankdev@gmail.com>

RUN dnf install -y git autoconf automake libtool make \
  readline-devel texinfo net-snmp-devel groff pkgconfig json-c-devel \
  pam-devel python3-pytest bison flex c-ares-devel python3-devel \
  python3-sphinx perl-core patch systemd-devel libcap-devel \
	sudo iproute traceroute iputils bash-completion tcpdump \
	wireshark-cli gdb wget vim libunwind libunwind-devel \
	iptables-services

RUN sh -c "echo source /usr/share/git-core/contrib/completion/git-prompt.sh >> ~/.bashrc"

ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/libyang-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/libyang-cpp-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/libyang-cpp-debuginfo-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/libyang-cpp-devel-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/libyang-debuginfo-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/libyang-debugsource-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/libyang-devel-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/python3-yang-0.16.111-0.x86_64.rpm /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Fedora-29-x86_64-Packages/python3-yang-debuginfo-0.16.111-0.x86_64.rpm /tmp

ADD ./enable_seg6_router.py /usr/bin/enable_seg6_router.py
ADD ./disable_seg6_router.py /usr/bin/disable_seg6_router.py
RUN chmod +x /usr/bin/enable_seg6_router.py
RUN chmod +x /usr/bin/disable_seg6_router.py
