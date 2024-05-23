#!/usr/bin/env bash

# ref https://help.aliyun.com/zh/ecs/user-guide/resize-cloud-disks/?spm=a2c4g.11186623.0.0.6fbb714axD8MnU

sudo fdisk -lu |grep gpt && echo go on || exit

sudo apt-get update
type growpart || sudo apt-get install -y cloud-guest-utils
type sgdisk || sudo apt-get install -y gdisk
sudo LC_ALL=en_US.UTF-8 growpart /dev/vda 3

sudo resize2fs /dev/vda3
