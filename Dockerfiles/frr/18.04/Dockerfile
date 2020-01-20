

FROM slankdev/ubuntu:18.04
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# (base=slankdev/ubuntu18:04) basic package install
ADD https://github.com/FRRouting/frr/releases/download/frr-6.0/frr_6.0-1.ubuntu18.04+1_amd64.deb /frr.deb
RUN apt update \
 && apt install -y iproute2 libatm1 libc-ares2 \
      libelf1 libmnl0 libpopt0 libxtables12 logrotate \
			libjson-c3 libreadline7 \
 && dpkg -i /frr.deb \
 && sed -i -e 's/=no/=yes/g' /etc/frr/daemons

# (Add util)
ADD ./enable_seg6_router.py /usr/bin/enable_seg6_router.py
ADD ./disable_seg6_router.py /usr/bin/disable_seg6_router.py
RUN chmod +x /usr/bin/enable_seg6_router.py
RUN chmod +x /usr/bin/disable_seg6_router.py
