FROM hadoop-base

HEALTHCHECK --interval=30s --timeout=20s --retries=7 --start-period=30s CMD curl -f http://localhost:9870/ 

# FsImage, EditLog 파일 경로
# FsImage : block replication 개수를 mapping 시켜놓은 정보
RUN mkdir $HADOOP_HOME/dfs/name

ADD start.sh /start.sh
RUN chmod a+x /start.sh

# 9000 : IPC port (namenode <> datanode 통신을 위한 포트)
# 9870 : NameNode HTTP web ui
EXPOSE 9000 9870

#CMD ["/start.sh"]
