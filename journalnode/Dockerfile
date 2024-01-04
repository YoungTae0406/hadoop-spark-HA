FROM hadoop-base

HEALTHCHECK CMD curl -f http://localhost:8480/ || exit 1
# 헬스체크 port

RUN mkdir $HADOOP_HOME/journal

# 포트 나중에