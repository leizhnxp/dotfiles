#!/usr/bin/env bash

sudo mkfs.ext4 /dev/xvdb
sudo mount /dev/xvdb /home/admin
sudo mkfs.ext4 /dev/xvdc
sudo mkdir -p /data
sudo mount /dev/xvdc /data

cd ~
mkdir $whoami

sudo mv $whoami /data
ln -s /data/$whoami ~/mate
