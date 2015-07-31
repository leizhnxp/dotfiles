#!/usr/bin/env bash

cd /opt
sudo wget https://github.com/antirez/redis/archive/2.8.21.tar.gz
sudo tar zxvf 2.8.21.tar.gz
cd redis-2.8.21/
sudo make install
cd ../
sudo rm -rf 2.8.21.tar.gz
