#!/usr/bin/env bash

cd /opt
sudo wget http://download.redis.io/releases/redis-3.2.8.tar.gz
sudo tar xzf redis-3.2.8.tar.gz
cd redis-3.2.8
sudo make install
cd ../
sudo rm -rf redis-3.2.8.tar.gz

