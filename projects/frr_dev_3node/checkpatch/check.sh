#!/bin/sh

if [ $# -ne 2 ]; then
	echo "invalid command syntax" 1>&2
	echo "Usage: $0 <frr-path> <commit>" 1>&2
	exit 1
fi
FRRPATH=$1
COMMIT=$2

#NAME=$(uuidgen)
NAME=hoge
docker rm -f $NAME
docker run -td --rm --name $NAME slankdev/checkpatch
docker cp $FRRPATH $NAME:/root/frr
docker cp execute.sh $NAME:/root
docker exec $NAME bash /root/execute.sh $COMMIT
