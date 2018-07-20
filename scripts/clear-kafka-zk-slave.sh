#!/bin/bash

KFK_RT=/root/local/kafka/default
LOG_RT=/root/local

KFK_LOG=$KFK_RT/logs/*
KFK_BAK=$LOG_RT/kafka/dirs/log/*
ZK_LOG=$LOG_RT/zookeeper/data/version-2/*

echo "Remove kafka log files ..."
rm -rf $KFK_LOG
rm -rf $KFK_BAK
echo "Done!"
echo "=========================="

echo "Remove zookeeper log files ..."
rm -rf $ZK_LOG
echo "Done!"
echo "=============================="
