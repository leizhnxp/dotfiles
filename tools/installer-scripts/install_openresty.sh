#!/usr/bin/env bash

sudo yum install yum-utils -y
sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
sudo yum install openresty -y

