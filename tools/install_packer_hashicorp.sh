#!/usr/bin/env bash

wget https://releases.hashicorp.com/packer/0.12.1/packer_0.12.1_linux_amd64.zip -O /tmp/packer.zip

mkdir -p ~/bin
unzip /tmp/packer.zip -d ~/bin/

