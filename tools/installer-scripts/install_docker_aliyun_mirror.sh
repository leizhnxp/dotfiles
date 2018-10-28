#!/usr/bin/env bash

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<EOF
{
    "registry-mirrors": ["$1"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
