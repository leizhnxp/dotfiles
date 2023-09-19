#!/usr/bin/env bash

# ref https://docs.docker.com/engine/install/centos/

# ref https://docs.docker.com/engine/install/centos/#set-up-the-repository
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# ref https://docs.docker.com/engine/install/centos/#install-docker-engine
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker

