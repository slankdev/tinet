#!/bin/sh
set -ue

mkdir -p /tmp/work && cd /tmp/work
rm -rf tinet
git clone https://github.com/slankdev/tinet
cd tinet
git checkout -b work-br origin/WIP-v0.0

pip3 install -r requirement.txt
tn version

cd /tmp/work/tinet/examples/basic_bfd         && tn init
cd /tmp/work/tinet/examples/basic_ebgp        && tn init
cd /tmp/work/tinet/examples/basic_ecmp        && tn init
cd /tmp/work/tinet/examples/basic_evpn        && tn init
cd /tmp/work/tinet/examples/basic_ibgp_rrg    && tn init
# cd /tmp/work/tinet/examples/basic_mplsg       && tn init
# cd /tmp/work/tinet/examples/basic_naptg       && tn init
# cd /tmp/work/tinet/examples/basic_netnsg      && tn init
# cd /tmp/work/tinet/examples/basic_ospfg       && tn init
# cd /tmp/work/tinet/examples/basic_pppoe_WIPg  && tn init
# cd /tmp/work/tinet/examples/basic_srmplsg     && tn init
# cd /tmp/work/tinet/examples/basic_srv6g       && tn init
# cd /tmp/work/tinet/examples/basic_tcg         && tn init
# cd /tmp/work/tinet/examples/basic_vrfg        && tn init
# cd /tmp/work/tinet/examples/basic_vrrpg       && tn init
# cd /tmp/work/tinet/examples/basic_vxlang      && tn init
# cd /tmp/work/tinet/examples/basic_xdpg        && tn init
