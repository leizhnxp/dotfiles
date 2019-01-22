#!/usr/bin/env bash

curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
    chmod +x /tmp/docker-machine && \
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -o ~/.completion_docker-machine.bash
curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash -o ~/.completion_docker-machine-wrapper.bash
curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash -o ~/.completion_docker-machine-prompt.bash

