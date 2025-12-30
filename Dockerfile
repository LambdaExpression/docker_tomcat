FROM tomcat:9.0.113-jdk8-corretto

# 安装开发调试工具集
RUN yum update -y && \
    yum install -y \
    procps-ng \
    vim-enhanced \
    zip \
    unzip \
    net-tools \
    iproute \
    telnet \
    wget \
    curl \
    lsof \
    tree \
    htop \
    nc \
    tcpdump && \
    yum clean all && \
    rm -rf /var/cache/yum

WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]
