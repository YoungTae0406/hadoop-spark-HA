#!bin/bash

YARN_SITE=/etc/hadoop/yarn-site.xml

# yarn-site.xml 파일 수정

sed -i '/<\/configuration>/d' $YARN_SITE
cat >> $YARN_SITE <<EOF
    <property>
        <name>yarn.nodemanager.hostname</name>
	    <value>${NODEMGR_HOSTNAME}</value>
    </property>
    <property>
        <name>yarn.nodemanager.address</name>
	    <value>${NODEMGR_IPC}</value>
    </property>

        
</configuration>
EOF

$HADOOP_HOME/bin/yarn --config $YARN_CONF_DIR nodemanager