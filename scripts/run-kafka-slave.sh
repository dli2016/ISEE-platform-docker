#!/bin/bash

HOSTNAME=`cat /etc/hostname`
KFK_HOME=/root/local/kafka/default
$KFK_HOME/bin/kafka-server-start.sh $KFK_HOME/config/server.properties
echo "======== KFK: $HOSTNAME DONE ========"
