#!/bin/bash
# hdfs-site.xml 파일 경로 설정
HDFS_SITE=/etc/hadoop/hdfs-site.xml

# hdfs-site.xml 파일 수정

sed -i '/<\/configuration>/d' $HDFS_SITE
cat >> $HDFS_SITE <<EOF
    <property>
        <name>dfs.datanode.address</name>
        <value>${DATANODE02_ADDRESS}</value>
    </property>
    <property>
        <name>dfs.datanode.http.address</name>
        <value>${DATANODE02_HTTP}</value>
    </property>
    <property>
        <name>dfs.datanode.ipc.address</name>
        <value>${DATANODE02_IPC}</value>
    </property>
</configuration>
EOF

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR datanode &
$HADOOP_HOME/bin/yarn --config $YARN_CONF_DIR nodemanager

