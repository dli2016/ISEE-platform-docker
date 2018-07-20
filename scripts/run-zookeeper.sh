#!/bin/bash

if [ $# != 1 ]; then
    echo "USAGE: $0 start/stop"
    exit 1
fi

if [ $1 = 'start' ];then
    ansible isee-cluster -m script -a "/root/scripts/run-zk-slave.sh"
elif [ $1 = 'stop' ];then
    ansible isee-cluster -m script -a "/root/local/kafka/default/bin/zookeeper-server-stop.sh"
else
    echo "USAGE: $0 start/stop"
    exit 1
fi
