FROM hadoop-base

ENV SPARK_VERSION=3.2.2
ENV SPARK_FILE_NAME=spark-$SPARK_VERSION-bin-hadoop3.2
ENV SAPRK_URL=https://dlcdn.apache.org/spark/spark-$SPARK_VERSION/$SPARK_FILE_NAME.tgz

# spark 설치
RUN wget $SAPRK_URL
RUN tar -xvzf $SPARK_FILE_NAME.tgz && rm $SPARK_FILE_NAME.tgz
RUN mv $SPARK_FILE_NAME /opt
RUN ln -s /opt/$SPARK_FILE_NAME /opt/spark

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin

# spark history log 디렉토리
RUN mkdir $SPARK_HOME/eventLog

# spark config file
ADD spark-defaults.conf $SPARK_HOME/conf