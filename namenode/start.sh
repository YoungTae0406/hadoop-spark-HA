#!/bin/bash
NAMENODE_DIR=/opt/hadoop/dfs/name
NAMENODE_ROLE=$1 

echo $NAMENODE_ROLE
check_and_restart_zkfc() {
    if ! jps | grep -q "DFSZKFailoverController" ; then
        $HADOOP_HOME/bin/hdfs --daemon start zkfc
    else
        echo "ZKFC is running."
    fi
}

if [ "$NAMENODE_ROLE" == "active" ]; then
  hdfs zkfc -formatZK
fi

# Active NameNode 포맷
if [ "$NAMENODE_ROLE" == "active" ]; then
    if [ ! "$(ls -A $NAMENODE_DIR)" ]; then
        hdfs namenode -format
        $HADOOP_HOME/bin/hdfs --daemon start zkfc
        $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
        
    else
        echo "NameNode directory is already formatted." >> /home/temp.log
    fi
fi

if [ "$NAMENODE_ROLE" == "standby" ]; then
  sleep 10
  hdfs namenode -bootstrapStandby
  $HADOOP_HOME/bin/hdfs --daemon start zkfc
  $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
fi

#echo "Starting ZKFC...2" >> /home/temp.log
#while true; do
#  check_and_restart_zkfc
#  sleep 40
#echo "ZKFC started.3" >> /home/temp.log
#$HADOOP_HOME/sbin/hadoop-daemon.sh start zkfc