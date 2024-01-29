FROM hadoop-base

ENV SPARK_VERSION=3.4.2
ENV SPARK_FILE_NAME=spark-$SPARK_VERSION-bin-hadoop3
ENV SAPRK_URL=https://dlcdn.apache.org/spark/spark-$SPARK_VERSION/$SPARK_FILE_NAME.tgz

# spark 설치
RUN wget $SAPRK_URL
RUN tar -xvzf $SPARK_FILE_NAME.tgz && rm $SPARK_FILE_NAME.tgz
RUN mv $SPARK_FILE_NAME /opt
RUN ln -s /opt/$SPARK_FILE_NAME /opt/spark
RUN apt-get install -y rsync

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin

ENV SPARK_MASTER_WEBUI_PORT=8080 \
SPARK_LOG_DIR=/opt/spark/logs 

# SPARK_LOG_DIR : 로그파일 저장 디렉토리

RUN mkdir -p $SPARK_LOG_DIR && \
mkdir -p /opt/spark/eventLog

# spark config file
ADD spark-defaults.conf $SPARK_HOME/conf
COPY start-spark.sh /
CMD ["/bin/bash", "/start-spark.sh"]