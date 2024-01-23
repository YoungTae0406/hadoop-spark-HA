FROM hadoop-base

HEALTHCHECK --interval=30s --timeout=20s --retries=7 --start-period=15s CMD curl -f http://localhost:8088/

ADD start.sh /start.sh
RUN chmod a+x /start.sh

# 8088 : yarn resource manager Web UI
# 8030 : yarn scheduler interface
# 8032 : yarn resource manager IPC port
EXPOSE 8088 8032 8030

ENTRYPOINT ["bash","-c","/start.sh"]
