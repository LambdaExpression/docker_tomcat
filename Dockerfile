FROM tomcat:9.0.113-jdk8

# 安装所有提到的工具
RUN apt-get update && \
    apt-get install -y \
    vim \
    procps \           # 提供完整的 ps 命令
    net-tools \        # 提供 netstat
    zip \
    unzip \
    curl \
    wget \             # 通常和 curl 一起安装
    iproute2 \         # 提供 ip、ss 命令（netstat 的替代）
    telnet \           # 可选：网络测试
    htop \             # 可选：更好的进程查看器
    nano && \          # 可选：备用编辑器
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 验证安装
RUN echo "Installed tools:" && \
    vim --version | head -1 && \
    ps --version && \
    netstat --version | head -1 && \
    zip --version | head -1 && \
    unzip --version | head -1 && \
    curl --version | head -1

WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]
