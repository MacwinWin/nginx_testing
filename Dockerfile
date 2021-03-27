# @author : microfat
# @time   : 03/26/21 07:59:53
# @File   : Dockerfile

FROM ubuntu:20.04
MAINTAINER xiang "2126881247@qq.com"

COPY . /app
WORKDIR /app

# 安装基础环境
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    # 设置python pip
    && apt-get install --no-install-recommends -y python3-pip python3-dev build-essential\
    && pip3 install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip \
    # 设置时区
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install --no-install-recommends -y tzdata \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# 安装项目环境
RUN apt-get install --no-install-recommends -y wget ca-certificates nginx supervisor \
    && pip3 install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt \
    && wget -P /root https://github.com/link1st/go-stress-testing/releases/download/0.1.5/go-stress-testing-linux \
    && chmod +x /root/go-stress-testing-linux 2021-03-25/run.sh 2021-03-26/run.sh\
    && apt-get purge -y --auto-remove wget\
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8964
ENTRYPOINT ["supervisord", "-n", "-c", "/app/supervisord.conf"]