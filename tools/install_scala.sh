#!/usr/bin/env bash

cd /opt
sudo wget "http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz"
sudo tar xvf scala-2.11.7.tgz
sudo ln -sf /opt/scala-2.11.7 /opt/scala
sudo rm -rf scala-2.11.7.tgz
scala -version
