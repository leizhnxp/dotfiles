#!/usr/bin/env bash    

sudo yum install wget vim -y
cd /etc/yum.repos.d/
sudo wget https://repo.mongodb.org/yum/redhat/mongodb-org.repo
sudo yum install mongodb-org -y
sudo service mongod restart
