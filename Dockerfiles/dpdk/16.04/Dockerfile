

FROM slankdev/ubuntu:16.04
MAINTAINER Hiroki Shirokura <slankdev@nttv6.jp>

RUN apt update \
 && apt install -y libnuma-dev numactl linux-headers-`uname -r`

WORKDIR /usr/local/src/git
RUN git clone git://dpdk.org/dpdk dpdk.master \
 && cp -rf dpdk.master dpdk.v16.11 \
 && cp -rf dpdk.master dpdk.v17.11 \
 && cp -rf dpdk.master dpdk.v18.11

WORKDIR /usr/local/src/http
ADD https://fast.dpdk.org/rel/dpdk-16.11.8.tar.xz dpdk-16.11.8.tar.xz
ADD https://fast.dpdk.org/rel/dpdk-17.11.4.tar.xz dpdk-17.11.4.tar.xz
ADD https://fast.dpdk.org/rel/dpdk-18.11.tar.xz   dpdk-18.11.tar.xz
RUN tar xpf dpdk-16.11.8.tar.xz \
 && tar xpf dpdk-17.11.4.tar.xz \
 && tar xpf dpdk-18.11.tar.xz

WORKDIR /usr/local/src/git/dpdk.v16.11
RUN git checkout -b v16.11 refs/tags/v16.11 \
 && export RTE_SDK=`pwd` \
 && export RTE_TARGET=x86_64-native-linuxapp-gcc \
 && make install T=$RTE_TARGET -j`nproc`

WORKDIR /usr/local/src/git/dpdk.v17.11
RUN git checkout -b v17.11 refs/tags/v17.11 \
 && export RTE_SDK=`pwd` \
 && export RTE_TARGET=x86_64-native-linuxapp-gcc \
 && make install T=$RTE_TARGET -j`nproc`

WORKDIR /usr/local/src/git/dpdk.v18.11
RUN git checkout -b v18.11 refs/tags/v18.11 \
 && export RTE_SDK=`pwd` \
 && export RTE_TARGET=x86_64-native-linuxapp-gcc \
 && make install T=$RTE_TARGET -j`nproc`

WORKDIR /usr/local/src/http/dpdk-stable-16.11.8
RUN export RTE_SDK=`pwd` \
 && export RTE_TARGET=x86_64-native-linuxapp-gcc \
 && make install T=$RTE_TARGET -j`nproc`

WORKDIR /usr/local/src/http/dpdk-stable-17.11.4
RUN export RTE_SDK=`pwd` \
 && export RTE_TARGET=x86_64-native-linuxapp-gcc \
 && make install T=$RTE_TARGET -j`nproc`

WORKDIR /usr/local/src/http/dpdk-18.11
RUN export RTE_SDK=`pwd` \
 && export RTE_TARGET=x86_64-native-linuxapp-gcc \
 && make install T=$RTE_TARGET -j`nproc`


