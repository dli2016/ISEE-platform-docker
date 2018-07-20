#!/bin/bash

ansible isee-cluster -m script -a "/root/scripts/clear-kafka-zk-slave.sh"
