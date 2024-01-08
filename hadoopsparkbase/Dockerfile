FROM hadoop-base

ENV SPARK_VERSION=3.4.2
ENV SPARK_FILE_NAME=spark-$SPARK_VERSION-bin-hadoop3
ENV SAPRK_URL=https://dlcdn.apache.org/spark/spark-$SPARK_VERSION/$SPARK_FILE_NAME.tgz

# spark 설치
RUN wget $SAPRK_URL
RUN tar -xvzf $SPARK_FILE_NAME.tgz && rm $SPARK_FILE_NAME.tgz
RUN mv $SPARK_FILE_NAME /opt
RUN ln -s /opt/$SPARK_FILE_NAME /opt/spark

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin

WORKDIR /opt/spark

ENV SPARK_MASTER_PORT=7077 \
SPARK_MASTER_WEBUI_PORT=8080 \
SPARK_LOG_DIR=/opt/spark/logs \
SPARK_MASTER_LOG=/opt/spark/logs/spark-master.out \
SPARK_WORKER_LOG=/opt/spark/logs/spark-worker.out \
SPARK_WORKER_WEBUI_PORT=8080 \
SPARK_WORKER_PORT=7000 \
SPARK_MASTER="spark://spark-master:7077" \
SPARK_WORKLOAD="master"
# MASTER_PORT : 마스터 노드가 클러스터 통신을 위해 사용하는 포트
# MASTER_WEBUI_PORT : 웹 UI에 접근하기 위한 포트
# SPARK_LOG_DIR : 로그파일 저장 디렉토리
# SPARK_MASTER_LOG : 마스터의 로그 출력 파일
# SPARK_WORKER_LOG : 워커의 로그 출력 파일
# SPARK_MASTER : 마스터 노드의 주소 워커 노드는 이 주소를 사용해 마스터와 연결함
# SPARK_WORKLOAD : 클러스터 내에서 노드의 역할
EXPOSE 8080 7077 7000

RUN mkdir -p $SPARK_LOG_DIR && \
touch $SPARK_MASTER_LOG && \
touch $SPARK_WORKER_LOG && \
ln -sf /dev/stdout $SPARK_MASTER_LOG && \
ln -sf /dev/stdout $SPARK_WORKER_LOG

# spark config file
ADD spark-defaults.conf $SPARK_HOME/conf
COPY start-spark.sh /
CMD ["/bin/bash", "/start-spark.sh"]