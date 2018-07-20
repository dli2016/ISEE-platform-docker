#!/bin/bash

# Get the number of slaves in cluster.
N=$1

if [ $# = 0 ]
then
    echo "Usage: sh set_slaves.sh slaves_num"
    exit 1
fi

# Generate slaves file
i=1
rm configs/hadoop/hadoop.slaves
rm configs/spark/spark.slaves
while [ $i -le $N ]
do
    echo "isee-task-nod$i" >> configs/hadoop/hadoop.slaves
    echo "isee-task-nod$i" >> configs/spark/spark.slaves
    ((i++))
done
