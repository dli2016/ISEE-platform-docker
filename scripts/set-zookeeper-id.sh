#!/bin/bash

hostname=`cat /etc/hostname`
kfk_home=/root/local/kafka/default
zk_home=/root/local/zookeeper

zk_id=${hostname##*[a-zA-Z]}
touch $zk_home/data/myid
echo $zk_id > $zk_home/data/myid
