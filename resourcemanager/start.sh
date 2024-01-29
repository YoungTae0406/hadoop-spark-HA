#!/bin/bash
YARN_SITE=/etc/hadoop/yarn-site.xml

# hdfs-site.xml 파일 수정

sed -i '/<\/configuration>/d' $YARN_SITE
cat >> $YARN_SITE <<EOF
    <property>
        <name>yarn.resourcemanager.ha.id</name>
        <value>${RM_ID}</value>
    </property>
</configuration>
EOF

$HADOOP_HOME/bin/yarn --config $HADOOP_CONF_DIR resourcemanager