#!/bin/bash

# Start Zookeeper
echo "Start Zookeeper ..."
sh run-zookeeper.sh start &
echo "Done!"
echo "========================================================================="
# Start Yarn
echo "Start Yarn ..."
sh run-yarn.sh start
echo "Done!"
echo "========================================================================="
# Start Spark
echo "Start Spark ..."
sh run-spark.sh start
echo "Done!"
echo "========================================================================="
# Start Kafka
echo "Start Kafka ..."
sh run-kafka.sh start &
echo "Done!"
echo "========================================================================="

