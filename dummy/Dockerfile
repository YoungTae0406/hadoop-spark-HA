FROM alpine

RUN apk add --no-cache curl netcat-openbsd
ADD healthcheckNN01.sh /healthcheckNN01.sh
ADD healthcheckNN02.sh /healthcheckNN02.sh
RUN chmod +x /healthcheckNN01.sh
RUN chmod +x /healthcheckNN02.sh
CMD ["tail", "-f", "/dev/null"]