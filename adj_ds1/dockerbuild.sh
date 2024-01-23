docker build -t hadoop-base ../hadoopbase
docker build -t dummy ../dummy
docker build -t hadoop-namenode ../namenode
docker build -t hadoop-datanode ../datanode
docker build -t resourcemanager ../resourcemanager
docker build -t hadoop-spark-base ../hadoopsparkbase
docker build -t zeppelin ../zeppelin