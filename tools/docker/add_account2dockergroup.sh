#!/usr/bin/env bash

### reference : https://www.jianshu.com/p/95e397570896

sudo groupadd docker
sudo gpasswd -a ${USER} docker

sudo systemctl restart docker

newgrp - docker
