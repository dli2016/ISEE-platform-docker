#!/bin/bash

# A simple example to test spark evironments.

echo $SPARK_HOME

spark-submit --class org.apache.spark.examples.SparkPi \
  --master yarn \
  --deploy-mode cluster \
  --driver-memory 4g \
  --executor-memory 2g \
  --executor-cores 1 \
  $SPARK_HOME/examples/jars/spark-examples*.jar \
  10
