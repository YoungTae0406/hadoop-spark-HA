#!/bin/sh
AWS1HOSTNAME=10.10.5.1
AWS2HOSTNAME=10.10.5.2
AWS3HOSTNAME=10.10.5.3
dj_ds0HOSTNAME=10.10.5.4
dj_ds1HOSTNAME=10.10.5.5

# JournalNode 01 체크
if ! curl -f http://${AWS1HOSTNAME}:8480/; then
  exit 1
fi

# JournalNode 02 체크
if ! curl -f http://${AWS2HOSTNAME}:8480/; then
  exit 1
fi

# JournalNode 03 체크
if ! curl -f http://${AWS3HOSTNAME}:8480/; then
  exit 1
fi

# Zookeeper 01 체크
if ! echo ruok | nc ${AWS1HOSTNAME} 2181 | grep -q imok; then
  exit 1
fi

# Zookeeper 02 체크
if ! echo ruok | nc ${AWS2HOSTNAME} 2181 | grep -q imok; then
  exit 1
fi

# Zookeeper 03 체크
if ! echo ruok | nc ${AWS3HOSTNAME} 2181 | grep -q imok; then
  exit 1
fi

exit 0