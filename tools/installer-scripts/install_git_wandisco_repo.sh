#!/usr/bin/env bash

sudo yum install wget -y 

cd /tmp/
wget http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-1.noarch.rpm

sudo rpm -ivh wandisco-git-release-7-1.noarch.rpm
rm -rf wandisco-git-release-7-1.noarch.rpm

