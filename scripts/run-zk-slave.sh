#!/bin/bash

HOSTNAME=`cat /etc/hostname`
ZK_ROOT=/root/local/kafka/default
$ZK_ROOT/bin/zookeeper-server-start.sh $ZK_ROOT/config/zookeeper.properties
echo "======== ZK: $HOSTNAME DONE ========"
