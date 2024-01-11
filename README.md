명령어

namenode Service State 확인 : hdfs haadmin -getAllServiceState
Standby -> Active : hdfs haadmin -transitionToActive nn1 --forcemanual
Active -> Standby : hdfs haadmin -transitionToStandby nn2 --forcemanual
namenode가 클러스터와 통신하는지 확인 : hdfs dfsadmin -report
RM 상태 확인 : yarn rmadmin -getAllServiceState

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
이렇게 쓰여진 명령어와
#$HADOOP_HOME/bin/hdfs --daemon start datanode
이런 형식으로 쓰여진 명령어의 차이
전자는 쉘 세션과 연결되어 foreground에서 실행된다. 
따라서 쉘 세션이 종료하면 그와 연결된 프로세스도 함께 종료된다.

후자는 background에서 실행되고, 쉘 세션의 종료와 무관하게 계속 실행된다. 
tail -f /dev/null

스파크 명령어
클러스터 모드로 실행 : spark-submit --master yarn --deploy-mode cluster [다른 옵션들] [애플리케이션 JAR 또는 Python 파일]

- Hadoop 서비스들이 사용하는 기본 웹 UI 포트
    - NameNode: 9870 (HTTP), 9871 (HTTPS)
    - NameNode: 8020 (metadata 작업 port)
    - DataNode: 9864 (HTTP), 9865 (HTTPS)
    - Secondary NameNode: 9868 (HTTP), 9869 (HTTPS)
    - JournalNode: 8480 (HTTP), 8481 (HTTPS)
    - MapReduce Job History: 19888 (HTTP), 19890 (HTTPS)
    - YARN ResourceManager: 8088 (HTTP), 8090 (HTTPS)
    - YARN NodeManager: 8042 (HTTP), 8044 (HTTPS)
    - Spark History : 18080
    - Spark UI : 4040
    - Spark MASTER_PORT : 7077
    - Spark MASTER_WEBUI_PORT : 8080
    - Spark WORKER_PORT : 7000

- 도커컴포즈에서 설정한 웹 UI 포트
    - namenode01 9200
    - namenode02 9201
    - datanode01 8900
    - datanode02 8901
    - datanode03 8902
    - datanode04 8903
    - spakr-master 9050
    - spark-worker1 9051
    - sprk-worker2 9052
    - resourcemanager01 9100
    - resourcemanager02 9101
    - sparkhistoryserver 9093
    - zookeeper(web ui 포트는 아님) 2181
- Hadoop 파일경로
    - HADOOP_HOME : /opt/hadoop
    - HADOOP_CONF_DIR : /etc/hadoop
    - YARN_CONF_DIR : /etc/hadoop
    - SPARK_HOME : /opt/spark
    - ZOOKEEPER_HOME : /opt/zookeeper/dfs
    - $HADOOP_HOME/dfs/data (datanode)
    - $HADOOP_HOME/yarn/data (nm)
    - $HADOOP_HOME/dfs/journal (journal)
    - RM의 state store : $HADOOP_HOME/yarn/system/rmstore