#!/usr/bin/env bash

wget http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm -O /tmp/mysql-community-release-el6-5.noarch.rpm
sudo rpm -ivh /tmp/mysql-community-release-el6-5.noarch.rpm

sudo yum install mysql-server -y
