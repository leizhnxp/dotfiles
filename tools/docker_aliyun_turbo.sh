#!/usr/bin/env bash

#
# https://cr.console.aliyun.com/?spm=5176.1971733.0.2.ch2yCi#/accelerator
#

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-EOF
{
    "registry-mirrors": ["$1"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

