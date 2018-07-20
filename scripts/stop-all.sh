#!/bin/bash

# Stop Zookeeper
echo "Stop Zookeeper ..."
sh run-zookeeper.sh stop &
echo "Done!"
echo "========================================================================="
# Stop Kafka
echo "Stop Kafka ..."
sh run-kafka.sh stop
echo "Done!"
echo "========================================================================="
# Stop Yarn
echo "Stop Yarn ..."
sh run-yarn.sh stop
echo "Done!"
echo "========================================================================="
# Stop Spark
echo "Stop Spark ..."
sh run-spark.sh stop
echo "Done!"
echo "========================================================================="

