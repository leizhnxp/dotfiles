#!/usr/bin/env bash

JAVA_VERSION=8u144
BUILD_VERSION=b01
wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm" -O /tmp/jdk-$JAVA_VERSION-$BUILD_VERSION-linux-x64.rpm
sudo rpm -ivh /tmp/jdk-$JAVA_VERSION-$BUILD_VERSION-linux-x64.rpm
rm -f /tmp/jdk-$JAVA_VERSION-$BUILD_VERSION-linux-x64.rpm
