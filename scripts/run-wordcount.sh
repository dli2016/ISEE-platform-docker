#!/bin/bash

# Test the hadoop cluster by running wordcount
# Copy from:
# https://github.com/kiwenlau/hadoop-cluster-docker/blob/master/config/run-wordcount.sh

# create input files
mkdir input
echo "Hello Docker" >input/file2.txt
echo "Hello Hadoop" >input/file1.txt

# create input directory on HDFS
hadoop fs -mkdir -p input

# put input files to HDFS
hdfs dfs -put ./input/* input

# run wordcount
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.5-sources.jar org.apache.hadoop.examples.WordCount input output

# print the input files
echo -e "\ninput file1.txt:"
hdfs dfs -cat input/file1.txt

echo -e "\ninput file2.txt:"
hdfs dfs -cat input/file2.txt

# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-r-00000
