#!/usr/bin/env bash

#
# http://decisionstats.com/2014/04/15/installing-scala-on-centos/
#
cd /opt
sudo wget "http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz"
sudo tar xvf scala-2.10.1.tgz
sudo ln -sf /opt/scala-2.10.1 /opt/scala
scala -version
