#!/usr/bin/env bash

# https://docs.docker.com/compose/install/

dockerComposeVersion=1.15.0

sudo curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl -L https://raw.githubusercontent.com/docker/compose/$dockerComposeVersion/contrib/completion/bash/docker-compose -o ~/.docker-compose-completion.sh

