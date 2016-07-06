#!/usr/bin/env bash

JAVA_VERSION=8u73
BUILD_VERSION=b02
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-$JAVA_VERSION-$BUILD_VERSION-linux-x64.rpm
sudo rpm -ivh /tmp/jdk-$JAVA_VERSION-$BUILD_VERSION-linux-x64.rpm
rm -f /tmp/jdk-$JAVA_VERSION-$BUILD_VERSION-linux-x64.rpm
