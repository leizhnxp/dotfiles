#!/usr/bin/env bash

self_dir=$(readlink -m $0|xargs dirname)

sudo cp $self_dir/etc/CentOS6-Base-rework.repo /etc/yum.repos.d/

sudo yum clean all
sudo yum makecache

