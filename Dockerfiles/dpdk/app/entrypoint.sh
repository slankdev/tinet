#!/bin/sh
set -ue
echo repo=$REPO commit=$COMMIT
mkdir -p /root/workspace
git clone $REPO /root/workspace/repo
cd /root/workspace/repo

git checkout -b WIP-interface-tapmirror origin/WIP-interface-tapmirror
./autogen.sh

export RTE_TARGET=x86_64-native-linuxapp-gcc

# export RTE_SDK=/usr/local/src/git/dpdk.v16.11
# ./configure && make clean && make

export RTE_SDK=/usr/local/src/git/dpdk.v17.11
./configure && make clean && make

export RTE_SDK=/usr/local/src/git/dpdk.v18.11
./configure && make clean && make

# export RTE_SDK=/usr/local/src/http/dpdk-stable-16.11.8
# ./configure && make clean && make

export RTE_SDK=/usr/local/src/http/dpdk-stable-17.11.4
./configure && make clean && make

# export RTE_SDK=/usr/local/src/http/dpdk-stable-18.11
# ./configure && make clean && make

