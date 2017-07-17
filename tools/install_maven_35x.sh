#!/usr/bin/env bash

mkdir -p ~/opt/
cd ~/opt/
wget "http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz" -O apache-maven-3.5.0-bin.tar.gz
tar xvf apache-maven-3.5.0-bin.tar.gz
rm -f apache-maven-3.5.0-bin.tar.gz

