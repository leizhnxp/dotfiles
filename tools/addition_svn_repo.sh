#!/usr/bin/env bash

self_dir=$(readlink -m $0|xargs dirname)

sudo cp $self_dir/etc/wandisco-svn.repo /etc/yum.repos.d/

