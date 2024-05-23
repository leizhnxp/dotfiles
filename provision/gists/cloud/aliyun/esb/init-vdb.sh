#!/usr/bin/env bash

# ref https://help.aliyun.com/zh/ecs/user-guide/initialize-a-data-disk-whose-size-does-not-exceed-2-tib-on-a-linux-instance?spm=a2c4g.11186623.0.0.24d42337QboLU7

sudo parted -s /dev/vdb mklabel gpt mkpart primary 1 100%
sudo partprobe
sudo mkfs -t ext4 /dev/vdb1

sudo mkdir -p /mnt/vdb
sudo mount /dev/vdb1 /mnt/vdb

