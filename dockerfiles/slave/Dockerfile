FROM cripac/centos7-isee-base-worker:0.1.3

MAINTAINER cripac <dli1988@126.com>

WORKDIR /root

# set necessary environments
ENV HADOOP_HOME=/root/local/hadoop/default
ENV SPARK_HOME=/root/local/spark/default
ENV KAFKA_HOME=/root/local/kafka/default

RUN mkdir ~/scripts

# Set hadoop configs
COPY configs/hadoop/* /tmp/
RUN mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    mv /tmp/mapred-env.sh $HADOOP_HOME/etc/hadoop/mapred-env.sh && \
    mv /tmp/yarn-env.sh $HADOOP_HOME/etc/hadoop/yarn-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/hadoop.log4j.properties $HADOOP_HOME/etc/hadoop/log4j.properties && \
    mv /tmp/hadoop.slaves $HADOOP_HOME/etc/hadoop/slaves

# Set spark configs
COPY configs/spark/* /tmp/
RUN mv /tmp/spark-env.sh $SPARK_HOME/conf/spark-env.sh && \
    mv /tmp/spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf && \
    mv /tmp/spark.log4j.properties $SPARK_HOME/conf/log4j.properties && \
    mv /tmp/spark.slaves $SPARK_HOME/conf/slaves && \
    mv /tmp/fairscheduler.xml $SPARK_HOME/conf/fairscheduler.xml

# Set kafka configs
COPY configs/kafka/* /tmp/
RUN mv /tmp/consumer.properties $KAFKA_HOME/config/consumer.properties && \
    mv /tmp/producer.properties $KAFKA_HOME/config/producer.properties && \
    mv /tmp/zookeeper.properties $KAFKA_HOME/config/zookeeper.properties && \
    mv /tmp/server.properties $KAFKA_HOME/config/server.properties && \
    mv /tmp/kafka.log4j.properties $KAFKA_HOME/config/log4j.properties

COPY scripts/* /tmp/

RUN mv /tmp/run-wordcount.sh ~/scripts/run-wordcount.sh && \
    mv /tmp/run-spark-pi.sh ~/scripts/run-spark-pi.sh && \
    mv /tmp/run-init-cmds-slave.sh ~/scripts/run-init-cmds.sh && \
    mv /tmp/check-nodes.sh ~/scripts/check-nodes.sh && \
    mv /tmp/run-kafka.sh ~/scripts/run-kafka.sh && \
    mv /tmp/clear-kafka-zk.sh ~/scripts/clear-kafka-zk.sh && \
    mv /tmp/clear-kafka-zk-slave.sh ~/scripts/clear-kafka-zk-slave.sh && \
    mv /tmp/kill-kafka-slave.sh ~/scripts/kill-kafka-slave.sh && \
    mv /tmp/run-kafka-slave.sh ~/scripts/run-kafka-slave.sh && \
    mv /tmp/run-spark.sh ~/scripts/run-spark.sh && \
    mv /tmp/run-yarn.sh ~/scripts/run-yarn.sh && \
    mv /tmp/run-zk-slave.sh ~/scripts/run-zk-slave.sh && \
    mv /tmp/run-zookeeper.sh ~/scripts/run-zookeeper.sh && \
    mv /tmp/set-zookeeper-id.sh ~/scripts/set-zookeeper-id.sh && \
    mv /tmp/start-all.sh ~/scripts/start-all.sh && \
    mv /tmp/stop-all.sh ~/scripts/stop-all.sh

RUN chmod +x ~/scripts/run-wordcount.sh && \
    chmod +x ~/scripts/run-spark-pi.sh && \
    chmod +x ~/scripts/run-init-cmds.sh && \
    chmod +x ~/scripts/check-nodes.sh && \
    chmod +x ~/scripts/run-kafka.sh && \
    chmod +x ~/scripts/clear-kafka-zk.sh && \
    chmod +x ~/scripts/clear-kafka-zk-slave.sh && \
    chmod +x ~/scripts/kill-kafka-slave.sh && \
    chmod +x ~/scripts/run-kafka-slave.sh && \
    chmod +x ~/scripts/run-spark.sh && \
    chmod +x ~/scripts/run-yarn.sh && \
    chmod +x ~/scripts/run-zk-slave.sh && \
    chmod +x ~/scripts/run-zookeeper.sh && \
    chmod +x ~/scripts/set-zookeeper-id.sh && \
    chmod +x ~/scripts/start-all.sh && \
    chmod +x ~/scripts/stop-all.sh

CMD ["sh","/root/scripts/run-init-cmds.sh"]
