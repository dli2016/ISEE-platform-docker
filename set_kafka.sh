#!/bin/bash

CONFIGS_RT=./configs
SLAVES=`cat $CONFIGS_RT/hadoop/hadoop.slaves`
SLAVES_NUM=0

# Set zookeeper.properties
# romove original settings of server.x
sed -e '/server\./d' $CONFIGS_RT/kafka/zookeeper.properties > zookeeper.properties.tmp
# Set new server.x.
for slave in $SLAVES
do
    SLAVES_NUM=$(( $SLAVES_NUM + 1 ))
    echo "server.$SLAVES_NUM=$slave:2888:3888" >> zookeeper.properties.tmp
done
mv zookeeper.properties.tmp $CONFIGS_RT/kafka/zookeeper.properties

# Set server.properties
NEW_STR=""
i=0
for slave in $SLAVES
do
    if [ "$i" == "0" ]
    then
        NEW_STR=$slave:2181
    else
        NEW_STR=$NEW_STR,$slave:2181
    fi
    i=$(( $i + 1 ))
done
LINE_NUM=`sed -n '/zookeeper.connect\=/=' $CONFIGS_RT/kafka/server.properties`
# Delete old line
sed -i "$LINE_NUM d" $CONFIGS_RT/kafka/server.properties
# Set new line.
NEW_STR="zookeeper.connect="$NEW_STR
sed -i "$LINE_NUM i$NEW_STR" $CONFIGS_RT/kafka/server.properties
