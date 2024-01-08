#!/bin/bash
NAMENODE_DIR=/opt/hadoop/dfs/name

NAMENODE_ROLE=${1:-"active"} # 기본값을 active로 설정

# Active NameNode 포맷
if [ "$NAMENODE_ROLE" == "active" ]; then
    if [ ! "$(ls -A $NAMENODE_DIR)" ]; then
        echo "Y" | hdfs namenode -format
        $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
    else
        echo "NameNode directory is already formatted."
    fi
fi

if [ "$NAMENODE_ROLE" == "standby" ]; then
  sleep 15
  hdfs namenode -bootstrapStandby
  $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
fi

sleep 10
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR zkfc -formatZK