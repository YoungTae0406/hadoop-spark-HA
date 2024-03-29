#!/bin/bash
docker-compose down
docker build -t language-base ./languagebase
docker build -t hadoop-base ./hadoopbase
docker build -t hadoop-spark-base ./hadoopsparkbase
docker build -t hadoop-namenode ./namenode
docker build -t hadoop-datanode ./datanode
docker build -t hadoop-rm ./resourcemanager
docker build -t spark-historyserver ./sparkhistoryserver
docker build -t hadoop-journalnode  ./journalnode
docker build -t hadoop-zookeeper ./zookeeper
docker build -t yarntimeline ./yarntimelineserver
docker build -t zeppelin ./zeppelin
docker build -t hadoop-hive ./hive

docker build -t dummy ./dummy
docker-compose up -d

