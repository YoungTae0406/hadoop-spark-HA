#!/bin/bash
docker build -t hadoop-base ../hadoopbase
docker build -t hadoop-zookeeper ../zookeeper
docker build -t hadoop-journalnode  ../journalnode
