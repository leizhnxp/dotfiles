#!/usr/bin/env bash

sudo yum install wget -y 

cd /tmp/
wget http://mirrors.neusoft.edu.cn/repoforge/redhat/el7/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

sudo rpm -ivh rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
rm -rf rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

