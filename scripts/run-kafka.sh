#!/bin/bash

if [ $# != 1 ]; then
    echo "USAGE: $0 start/stop"
    exit 1
fi

if [ $1 = 'start' ];then
    ansible isee-cluster -m script -a "/root/scripts/run-kafka-slave.sh"
elif [ $1 = 'stop' ];then
    ansible isee-cluster -m script -a "/root/scripts/kill-kafka-slave.sh"
else
    echo "USAGE: $0 start/stop"
    exit 1
fi
