#!/bin/sh
# spark on yarn 모드에서는 client모드만 로그로 남는다고 함. 
# cluster모드로 동작시 로그를 남기지 않는다고 함. 
echo "run"

/opt/spark/sbin/start-history-server.sh

echo "sleep -"
sleep infinity
