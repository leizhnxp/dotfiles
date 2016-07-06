#!/usr/bin/env bash

mkdir -p ~/opt/
cd ~/opt/
wget "http://mirror.bit.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz" -O apache-maven-3.3.9-bin.tar.gz
tar xvf apache-maven-3.3.9-bin.tar.gz
rm -f apache-maven-3.3.9-bin.tar.gz

