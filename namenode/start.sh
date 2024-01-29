#!/bin/bash
NAMENODE_DIR=/opt/hadoop/dfs/name
NAMENODE_ROLE=$1 

HDFS_SITE=/etc/hadoop/hdfs-site.xml

# hdfs-site.xml 파일 수정

sed -i '/<\/configuration>/d' $HDFS_SITE
cat >> $HDFS_SITE <<EOF
    <property>
      <name>dfs.ha.namenode.id</name>
      <value>${NAMENODE_ID}</value>
    </property>
</configuration>
EOF

# Active NameNode 포맷
if [ "$NAMENODE_ROLE" == "active" ]; then
    if [ ! "$(ls -A $NAMENODE_DIR)" ]; then
        echo Y | hdfs zkfc -formatZK
        sleep 4
        echo Y | hdfs namenode -format
        $HADOOP_HOME/bin/hdfs --daemon start zkfc
        $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
    else
        echo "NameNode directory is already formatted." >> /home/temp.log
        $HADOOP_HOME/bin/hdfs --daemon start zkfc
        $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode 
    fi
fi

if [ "$NAMENODE_ROLE" == "standby" ]; then
  if [ ! "$(ls -A $NAMENODE_DIR)" ]; then
    sleep 5
    hdfs namenode -bootstrapStandby
  else
    echo "Standby NameNode directory is already formatted." >> /home/temp.log
  fi
  $HADOOP_HOME/bin/hdfs --daemon start zkfc
  $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
  
fi

# tail -f /dev/null