#!/bin/sh

if [ $# -ne 1 ]; then
	echo "invalid command syntax" 1>&2
	echo "Usage: $0 <commit>" 1>&2
	exit 1
fi
COMMIT=$1

cd /root/frr
git checkout $1
git format-patch HEAD~1
mv 0001-*.patch /0001.patch
git checkout HEAD~1

cd tools
./checkpatch.sh /0001.patch ..
