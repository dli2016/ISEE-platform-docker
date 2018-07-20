#!/bin/bash

CONFIGS_RT=./configs
SLAVES=`cat $CONFIGS_RT/hadoop/hadoop.slaves`

ANSIBLE_CONF=$CONFIGS_RT/ansible/hosts
rm $ANSIBLE_CONF
touch $ANSIBLE_CONF

echo "[isee-cluster]" >> $ANSIBLE_CONF
for slave in $SLAVES
do
    echo $slave >> $ANSIBLE_CONF
done
