#!bin/bash

hive --service metastore &
# JDBC Server.
$HIVE_HOME/bin/hiveserver2 &

tail -f /dev/null