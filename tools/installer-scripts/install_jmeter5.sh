#!/usr/bin/env bash

cd 
mkdir -p tmp
cd tmp
wget http://mirrors.tuna.tsinghua.edu.cn/apache//jmeter/binaries/apache-jmeter-5.0.tgz

tar xvf apache-jmeter-5.0.tgz -C ~/opt/

mkdir ~/bin
ln -sf ~/bin/jmeter ~/opt/apache-jmeter-5.0/bin/jmeter

