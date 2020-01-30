FROM slankdev/ubuntu:18.04
MAINTAINER Hiroki Shirokura <slank.dev@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Debian-AMD64-Packages/libyang-dev_0.16.105-1_amd64.deb /tmp
ADD https://ci1.netdef.org/artifact/LIBYANG-YANGRELEASE/shared/build-10/Debian-AMD64-Packages/libyang0.16_0.16.105-1_amd64.deb /tmp
RUN apt update && apt install -y \
		 git autoconf automake libtool make libreadline-dev texinfo \
		 pkg-config libpam0g-dev libjson-c-dev bison flex python3-pytest \
		 libc-ares-dev python3-dev libsystemd-dev python-ipaddress python3-sphinx \
		 install-info build-essential libsystemd-dev libsnmp-dev perl libcap-dev \
		 libpcre3-dev \
 && apt install /tmp/libyang0.16_0.16.105-1_amd64.deb \
 && apt install /tmp/libyang-dev_0.16.105-1_amd64.deb

RUN apt install -y mininet python-pip gdb \
 && pip install ipaddr "pytest<5" exabgp==3.4.17 \
 && useradd -d /var/run/exabgp/ -s /bin/false exabgp

RUN git clone https://github.com/slankdev/frr /root/frr && cd /root/frr \
 && git checkout -b work2 origin/work2 && ./bootstrap.sh \
 && ./configure \
    --prefix=/usr \
    --localstatedir=/var/run/frr \
    --sbindir=/usr/lib/frr \
    --sysconfdir=/etc/frr \
    --enable-vtysh \
    --enable-pimd \
    --enable-sharpd \
    --enable-multipath=64 \
    --enable-user=frr \
    --enable-group=frr \
    --enable-vty-group=frrvty \
    --with-pkg-extra-version=-my-manual-build \
 && addgroup --system --gid 92 frr \
 && addgroup --system --gid 85 frrvty \
 && adduser --system --ingroup frr --home /var/run/frr/ \
			 --gecos "FRRouting suite" --shell /bin/false frr \
 && usermod -G frrvty frr \
 && make -j8 && make install

RUN apt install -y neovim \
 && git clone https://github.com/slankdev/dotfiles /root/dotfiles \
 && cd /root/dotfiles && bash setup.sh init

COPY docker-start /usr/bin/docker-start
ENTRYPOINT [ "/usr/bin/docker-start" ]
