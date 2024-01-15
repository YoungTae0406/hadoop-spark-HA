#!bin/bash

hive --service metastore &
# JDBC Server.
hiveserver2 &

tail -f /dev/null