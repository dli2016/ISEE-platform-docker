#!/bin/bash

. ~/.bashrc

# Input checking ...
if [ $# != 1 ]; then
    echo "USAGE: $0 start/stop"
    exit 1
fi

# Operations on cluster ...
if [ $1 = "start" ];then
    echo "==== Start the YARN cluster ..."
    SCRIPT=$HADOOP_HOME/sbin/start-all.sh
    bash $SCRIPT
    echo "==== DONE!"
elif [ $1 = "stop" ];then
    echo "==== Stop the YARN cluster ..."
    SCRIPT=$HADOOP_HOME/sbin/stop-all.sh
    bash $SCRIPT
    echo "==== DONE!"
fi
