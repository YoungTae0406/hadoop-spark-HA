FROM hadoop-base

RUN mkdir -p $HADOOP_HOME/yarn/data
RUN mkdir -p /opt/spark/eventLog

ADD start.sh /start.sh
RUN chmod a+x /start.sh

ENTRYPOINT ["bash","-c","/start.sh"]
