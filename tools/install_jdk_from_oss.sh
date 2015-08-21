#!/usr/bin/env bash

sudo yum erase java-*-openjdk-* -y
osscmd get oss://000323/jdk/jdk-8u5-linux-x64.rpm /tmp/jdk-8u5-linux-x64.rpm
sudo rpm -ivh /tmp/jdk-8u5-linux-x64.rpm
