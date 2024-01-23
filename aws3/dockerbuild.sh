#!/bin/bash
docker build -t hadoop-base ../hadoopbase
docker build -t hadoop-journalnode  ../journalnode
docker build -t hadoop-zookeeper ../zookeeper