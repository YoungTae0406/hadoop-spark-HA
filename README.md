명령어
 
namenode Service State 확인 : hdfs haadmin -getAllServiceState
Standby -> Active : hdfs haadmin -transitionToActive nn1 --forcemanual
Active -> Standby : hdfs haadmin -transitionToStandby nn2 --forcemanual
namenode가 클러스터와 통신하는지 확인 : hdfs dfsadmin -report

$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
이렇게 쓰여진 명령어와
#$HADOOP_HOME/bin/hdfs --daemon start datanode
이런 형식으로 쓰여진 명령어의 차이
전자는 쉘 세션과 연결되어 foreground에서 실행된다. 
따라서 쉘 세션이 종료하면 그와 연결된 프로세스도 함께 종료된다.

후자는 background에서 실행되고, 쉘 세션의 종료와 무관하게 계속 실행된다. 
tail -f /dev/null
