#!/bin/bash

MASTER=isee-master
SLAVES=`cat configs/hadoop/hadoop.slaves`

# Stop master container
docker stop $MASTER

# Stop slave container
for slave in $SLAVES
do
    docker stop $slave
done
