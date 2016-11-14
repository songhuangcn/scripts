#!/bin/sh

sudo yum update -y && \
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
sudo systemctl enable docker.service && \
sudo systemctl start docker && \
sudo usermod -aG docker $USER && newgrp docker
sudo bash -c 'curl -L https://get.daocloud.io/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose' && \
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://961799e4.m.daocloud.io && \
sudo systemctl daemon-reload && \
sudo systemctl restart docker.service
sudo yum install -y make
docker --version && docker-compose --version && make --version
