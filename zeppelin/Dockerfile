FROM hadoop-spark-base

#HEALTHCHECK CMD curl -f http://localhost:8080/ 
ENV ZEPPELIN_VERSION=0.10.1
ENV ZEPPELIN_FILE_NAME=zeppelin-$ZEPPELIN_VERSION-bin-all

RUN wget https://dlcdn.apache.org/zeppelin/zeppelin-$ZEPPELIN_VERSION/$ZEPPELIN_FILE_NAME.tgz

RUN tar -xvzf $ZEPPELIN_FILE_NAME.tgz && rm $ZEPPELIN_FILE_NAME.tgz

ADD zeppelin-site.xml /$ZEPPELIN_FILE_NAME/conf
ADD zeppelin-env.sh /$ZEPPELIN_FILE_NAME/conf 
ADD start.sh /start.sh
RUN chmod 700 /start.sh

ENV ZEPPELIN_HOME=/zeppelin-0.10.1-bin-all

HEALTHCHECK --interval=30s --timeout=20s --start-period=15s --retries=5 CMD curl -f http://localhost:8080/

# 8080 : zeppelin web UI port
EXPOSE 8080

CMD ["/start.sh"]