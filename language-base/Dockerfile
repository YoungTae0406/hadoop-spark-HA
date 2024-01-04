FROM centos

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN \\
    yum update -y && \\
    yum install net-tools -y && \\
    yum install vim-enhanced -y && \\
    yum install wget -y && \\
    yum install openssh-server openssh-clients openssh-askpass -y && \\
    yum install java-1.8.0-openjdk-devel.x86_64 -y && \\
    mkdir /opt/jdk && \\
    ln -s /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.332.b09-1.el7_9.x86_64 /opt/jdk/current

RUN wget $PYTHON_URL
RUN tar -xvzf Python-$PYTHON_VERSION.tgz && rm Python-$PYTHON_VERSION.tgz
RUN /Python-$PYTHON_VERSION/configure --enable-optimizations
RUN make altinstall
RUN ln -s /usr/local/bin/python3.7 /usr/bin/python3
RUN ln -s /usr/local/bin/python3.7 /usr/bin/python

# java install
RUN yum install -y java-1.8.0-openjdk.x86_64
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-2.el8_5.x86_64/jre


