FROM hadoop-base

HEALTHCHECK --interval=60s CMD curl -f http://localhost:8480/ || exit 1
# 헬스체크 port

RUN mkdir $HADOOP_HOME/dfs/journal
ADD start.sh /start.sh
RUN chmod a+x /start.sh

ENTRYPOINT ["bash","-c","/start.sh"]
# 포트 나중에