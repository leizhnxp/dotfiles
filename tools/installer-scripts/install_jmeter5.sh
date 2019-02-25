#!/usr/bin/env bash

set -e

cd 
mkdir -p tmp
cd tmp
wget http://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/binaries/apache-jmeter-5.1.tgz

tar xvf apache-jmeter-5.1.tgz -C ~/opt/
rm apache-jmeter-5.1.tgz

mkdir -p ~/bin
ln -sfT ~/opt/apache-jmeter-5.0/bin/jmeter ~/bin/jmeter

