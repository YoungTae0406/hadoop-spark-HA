FROM ubuntu

RUN apt-get update && \
    apt-get install -y net-tools && \
    apt-get install -y iputils-ping && \
    apt-get install -y vim && \
    apt-get install -y wget && \
    apt-get install -y curl && \
    apt-get install -y netcat && \
    apt-get install -y openssh-server openssh-client && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y gcc make libssl-dev zlib1g-dev libbz2-dev libffi-dev

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$PATH:JAVA_HOME/bin
ENV PYTHON_VERSION=3.10.4
ENV PYTHON_URL=https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz 

RUN wget $PYTHON_URL
RUN tar -xvzf Python-$PYTHON_VERSION.tgz && rm Python-$PYTHON_VERSION.tgz
RUN cd Python-$PYTHON_VERSION && ./configure --enable-optimizations && make -j $(nproc) altinstall


