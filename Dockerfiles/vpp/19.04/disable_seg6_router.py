#!/usr/bin/env python3
import os

print('#!/bin/sh')
print('sysctl -w net.ipv6.conf.all.forwarding=1')
print('sysctl -w net.ipv6.conf.all.disable_ipv6=0')
print('sysctl -w net.ipv6.conf.all.seg6_enabled=0')
print('sysctl -w net.ipv4.conf.all.rp_filter=0')
print('sysctl -w net.ipv6.conf.default.forwarding=1')
print('sysctl -w net.ipv6.conf.default.disable_ipv6=0')
print('sysctl -w net.ipv6.conf.default.seg6_enabled=0')
print('sysctl -w net.ipv4.conf.default.rp_filter=0')
ifs = os.listdir(path='/sys/class/net')
for iface in ifs:
    print('sysctl -w net.ipv6.conf.{}.disable_ipv6=0'.format(iface))
    print('sysctl -w net.ipv6.conf.{}.seg6_enabled=0'.format(iface))
    print('sysctl -w net.ipv4.conf.{}.rp_filter=0'.format(iface))


