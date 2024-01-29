FROM hadoop-base

RUN mkdir $HADOOP_HOME/dfs/data

# 9864 : datanode web ui port

ADD start.sh /start.sh
RUN chmod a+x /start.sh

RUN mkdir -p /opt/spark/eventLog

ENTRYPOINT ["bash","-c","/start.sh"]

