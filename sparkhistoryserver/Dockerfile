FROM hadoop-spark-base

HEALTHCHECK --start-period=60s CMD curl -f http://localhost:18080/ || exit 1

# 18080 : spark history의 웹 UI 포트.

EXPOSE 18080

COPY start.sh /start.sh
RUN chmod 700 /start.sh

ENTRYPOINT ["bash","-c","/start.sh"]
