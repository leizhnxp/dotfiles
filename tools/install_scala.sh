#!/usr/bin/env bash

#
# http://decisionstats.com/2014/04/15/installing-scala-on-centos/
#
cd /opt
sudo wget "http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz?_ga=1.111076165.132050695.1435069180"
sudo tar xvf scala-2.10.1.tgz
sudo ln -s /opt/scala-2.10.1 /usr/lib/scala
export PATH=$PATH:/usr/lib/scala/bin
scala -version
