#!/bin/bash
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR datanode &
$HADOOP_HOME/bin/yarn --config $YARN_CONF_DIR nodemanager

#sleep 15
#$HADOOP_HOME/bin/hdfs --daemon start datanode
#$HADOOP_HOME/sbin/yarn-daemon.sh start nodemanager
#$HADOOP_HOME/bin/yarn --daemon start nodemanager
#tail -f /dev/null