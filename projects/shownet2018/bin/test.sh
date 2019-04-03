#!/bin/sh
set -ue

if [ $# -ne 1 ]; then
	echo "invalid command syntax" 1>&2
	echo "Usage: $0 <machine-id>" 1>&2
	exit 1
fi
MACHINE=$1

ping -c1 10.110.0.$MACHINE
ping -c1 10.111.0.$MACHINE
ping -c1 10.120.0.$MACHINE
ping -c1 10.121.0.$MACHINE
ping -c1 10.210.0.$MACHINE
ping -c1 10.211.0.$MACHINE
ping -c1 10.220.0.$MACHINE
ping -c1 10.221.0.$MACHINE

ping -c1 cafe:110::$MACHINE
ping -c1 cafe:111::$MACHINE
ping -c1 cafe:120::$MACHINE
ping -c1 cafe:121::$MACHINE
ping -c1 cafe:210::$MACHINE
ping -c1 cafe:211::$MACHINE
ping -c1 cafe:220::$MACHINE
ping -c1 cafe:221::$MACHINE
