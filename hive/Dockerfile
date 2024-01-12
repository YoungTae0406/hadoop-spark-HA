FROM hadoop-base

ENV HIVE_VERSION=3.1.3
ENV HIVE_FILE_NAME=hive-$HIVE_VERSION
ENV HIVE_URL=https://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz

RUN wget $HIVE_URL
RUN tar -xvzf $HIVE_FILE_NAME.tar.gz && rm $HIVE_FILE_NAME.tar.gz

RUN mv $HIVE_FILE_NAME /opt
RUN ln -s /opt/$HIVE_FILE_NAME /opt/hive
ENV HIVE_HOME=/opt/hive

RUN ln -s $HIVE_HOME/etc/hive /etc/hive
ENV HIVE_CONF_DIR=/etc/hive

RUN mkdir -p "${HIVE_HOME}/hcatalog/var/log" && \
    mkdir -p "${HIVE_HOME}/var/log"

ENV PATH ="${PATH}:${HIVE_HOME}/bin"
ENV HADOOP_CLASSPATH="${HADOOP_CLASSPATH}:${HIVE_HOME}/lib/*"
ADD hive-site.xml "${HIVE_CONF_DIR}"