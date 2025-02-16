#!/bin/sh

# https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER # 防止使用 docker 需要 sudo

# test
docker version
docker compose version
