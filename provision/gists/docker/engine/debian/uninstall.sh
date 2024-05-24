#!/usr/bin/env bash

# ref https://docs.docker.com/engine/install/debian/#uninstall-docker-engine

sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

sudo apt-get autoremove -y

sudo rm -f /etc/apt/sources.list.d/docker.list

