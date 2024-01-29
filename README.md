nn이 다른 호스트 서버에 배치될 때 설정파일의 id 부분을 명시적으로 설정해줘야함.

- 하둡 명령어
    - namenode Service State 확인 : hdfs haadmin -getAllServiceState
    - Standby -> Active : hdfs haadmin -transitionToActive nn1 --forcemanual
    - Active -> Standby : hdfs haadmin -transitionToStandby nn2 --forcemanual
    - namenode가 클러스터와 통신하는지 확인 : hdfs dfsadmin -report
    - RM HA 상태 확인 : yarn rmadmin -getAllServiceState
    - yarn 클러스터 상태 확인 : yarn node -list
    - yarn applicatino 상태 확인 : yarn application -list
    - yarn 완료된 application 확인 : yarn application        -list -appStates FINISHED
    

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
이렇게 쓰여진 명령어와
#$HADOOP_HOME/bin/hdfs --daemon start datanode
이런 형식으로 쓰여진 명령어의 차이
전자는 쉘 세션과 연결되어 foreground에서 실행된다. 
따라서 쉘 세션이 종료하면 그와 연결된 프로세스도 함께 종료된다.
후자는 background에서 실행되고, 쉘 세션의 종료와 무관하게 계속 실행된다. 
tail -f /dev/null
- 스파크 명령어
    - 클러스터 모드로 실행 : spark-submit --master yarn --deploy-mode cluster [다른 옵션들] [애플리케이션 JAR 또는 Python 파일]
    다른 옵션들에는 --conf 여기서는 spark.executor.memory나 spark.driver.memory 등의 속성을 설정할 수 있다.
    --executor-memory 4g
    --executor-cores 2
    --num-executors 10 (yarn에서만)
    --name : Spark UI에 표시될 애플리케이션의 이름을 지정
    --driver-memory
    --py-files 

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

- zookeeper 포트
    - 2181 : 클라이언트가 서버에 연결하는 데 사용하는 포트
    이 포트로 zookeeper 앙상블과 통신함.
    - 2888 : 앙상블 내에서 리더와 팔로워 간의 통신에 사용됨.
    - 3888 : 서버 간 리더 선출을 위해 사용되는 포트
- journal 포트
    - 8485 : journalnode간의 통신을 위한 rpc 포트
    - 8480 : http 포트
    - 8481 : https 포트
- namenode 포트
    - 8019 : zkfc port
    - 8020 : rpc 포트
    - 9870 : http 포트
    - 9871 : https 포트
    - 50100 : backup 포트
    - 50105 : backup http 포트
- datanode 포트
    - 9864 : http 포트
    - 9865 : https 포트
    - 9866 : 데이터 블록을 읽고 쓰기 위해 namenode와 클라이언트와 통신
    - 9867 : datanode가 namenode와 상호작용하는 ipc 포트
- resourcemanager 포트
    - 8032 : rpc 포트
    - 8030 : 스케줄러 포트, client나 am이 rm의 스케쥴러와 통신
    - 8033 : 관리자 인터페이스 포트 (클러스터 설정 변경, 상태 업데이트, 감시 작업)
    - 8050 : ipc 포트. nodemanager와 am와 통신
    - 8088 : http 포트
    - 8031 : resource-tracker 포트
    - 8090 : https 포트
- nodemanager 포트
    - 8040 : 로컬라이즈 포트. 노드매니저가 컨테이너에 리소스를 제공하는데 사용함 기본적으로 동적으로 할당됨 ipc 포트
    - 8042 : 웹 포트
    - 8048 : timeline과 통신하는 포트
- yarntimeline 포트
    - 10200 : This is default address for the timeline server to start the RPC server.
    - 8188 : http port
    - 8190 : https port
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

로그 경로
namenode : /opt/hadoop/logs/