
FROM slankdev/dpdk
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

# move to slankdev/dpdk
RUN apt update && apt install -y \
    build-essential libnss-extrausers \
    vim python xz-utils \
    sysstat screen git ntp ntpdate tig bwm-ng tmux \
    silversearcher-ag libnuma-dev automake

# move to slankdev/dpdk
WORKDIR /tmp
ADD http://www.lttng.org/files/urcu/userspace-rcu-0.9.3.tar.bz2 userspace-rcu.tar.bz2
RUN tar xpf userspace-rcu.tar.bz2 && cd userspace-rcu-0.9.3 \
 && ./configure && make -j`nproc` && make install -j`nproc`

# ENV REPO ????
ENV REPO https://github.com/slankdev/xellico

ENV COMMIT master
WORKDIR /root/workspace
COPY ./entrypoint.sh /
# CMD /entrypoint.sh
CMD bash

