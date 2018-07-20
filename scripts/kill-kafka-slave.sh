#!/bin/bash

JAVA_HOME=/usr/lib/jvm/java
JPS=`$JAVA_HOME/bin/jps`

PS_ARR=($JPS)
echo $JPS

# Confirm the #ps of kafka.
for ps in $JPS
do
    if [ $ps = "Kafka" ]; then
        j=$(($i))
    fi
    i=$(($i+1))
done

# Kill kafka ...
echo "=========================="
echo "Kafka PS: ${PS_ARR[$(($j-1))]}"
echo "Kill Kafka ..."
kill -9 ${PS_ARR[$(($j-1))]}
echo "Done!"
