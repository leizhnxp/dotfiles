#!/usr/bin/env bash

# ref https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine

sudo apt-get autoremove -y --purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

sudo rm -rf /etc/apt/sources.list.d/docker.list
sudo rm -rf /etc/apt/keyrings/docker.asc

sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

