FROM hadoop-base

ENV HIVE_VERSION=3.1.3
ENV HIVE_FILE_NAME=hive-$HIVE_VERSION
ENV HIVE_URL=https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz

# mysql 
RUN wget https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-java-8.0.28.tar.gz && \
    tar -zxvf mysql-connector-java-8.0.28.tar.gz && \
    mv mysql-connector-java-8.0.28/mysql-connector-java-8.0.28.jar $HIVE_HOME/lib

# hive 
RUN wget $HIVE_URL
RUN tar -xvzf apache-$HIVE_FILE_NAME-bin.tar.gz && rm apache-$HIVE_FILE_NAME-bin.tar.gz
RUN mv apache-$HIVE_FILE_NAME-bin /opt

RUN ln -s /opt/apache-$HIVE_FILE_NAME-bin /opt/hive
ENV HIVE_HOME=/opt/hive

RUN ln -s $HIVE_HOME/etc/hive /etc/hive
ENV HIVE_CONF_DIR=/etc/hive

RUN mkdir $HIVE_HOME/log

ENV PATH ="${PATH}:${HIVE_HOME}/bin"
ENV HADOOP_CLASSPATH="${HADOOP_CLASSPATH}:${HIVE_HOME}/lib/*"
ADD hive-site.xml "${HIVE_CONF_DIR}"
