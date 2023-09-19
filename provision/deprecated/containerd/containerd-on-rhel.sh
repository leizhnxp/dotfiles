#!/usr/bin/env bash

## ref https://docs.docker.com/engine/install/centos/
## ref https://github.com/containerd/containerd/blob/main/docs/getting-started.md

#sudo yum remove docker \
	#                  docker-client \
	#                  docker-client-latest \
	#                  docker-common \
	#                  docker-latest \
	#                  docker-latest-logrotate \
	#                  docker-logrotate \
	#                  docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager \
	   --add-repo \
	       https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y containerd.io

sudo systemctl enable containerd
sudo systemctl restart containerd
