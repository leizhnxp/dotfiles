#!/usr/bin/env bash

cd /opt/
sudo wget "http://mirrors.cnnic.cn/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz" -O apache-maven-3.3.3-bin.tar.gz
sudo tar xvf apache-maven-3.3.3-bin.tar.gz
sudo rm -f apache-maven-3.3.3-bin.tar.gz

