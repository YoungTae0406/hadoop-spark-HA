FROM hadoop-base

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ADD hdfs-site.xml $HADOOP_CONF_DIR

RUN mkdir $HADOOP_HOME/dfs/data

RUN mkdir -p $HADOOP_HOME/yarn/data

# 9864 : datanode web ui port
# 8042 : yarn nodemanager webapp address

EXPOSE 9864 9866 8042 

ADD start.sh /start.sh
RUN chmod a+x /start.sh

RUN mkdir -p /opt/spark/eventLog

CMD ["/start.sh"]

