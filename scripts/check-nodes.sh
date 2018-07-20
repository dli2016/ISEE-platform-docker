#!/bin/bash

# master
echo "======= master"
$JAVA_HOME/bin/jps

# slaves
NODES=`cat /root/local/hadoop/default/etc/hadoop/slaves`
for node in $NODES
do
    echo "======= $node"
    ssh $node "$JAVA_HOME/bin/jps"
done
