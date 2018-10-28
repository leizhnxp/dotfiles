#!/usr/bin/env bash

ver=0.12.2
wget https://releases.hashicorp.com/packer/$ver/packer_${ver}_linux_amd64.zip -O /tmp/packer.zip

mkdir -p ~/bin
rm -rf ~/bin/packer
unzip /tmp/packer.zip -d ~/bin/
rm -rf /tmp/packer.zip

