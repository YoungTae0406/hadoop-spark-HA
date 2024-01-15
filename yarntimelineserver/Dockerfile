FROM hadoop-base

HEALTHCHECK CMD curl -f http://localhost:8188/

ADD start.sh /start.sh
RUN chmod a+x /start.sh

# 8188 : yarn timeline web UI port
# 10200 : yarn timeline service port
EXPOSE 8188 10200

CMD ["/start.sh"]