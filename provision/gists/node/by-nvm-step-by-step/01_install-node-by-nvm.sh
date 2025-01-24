#!/usr/bin/env bash

### ref : https://nodejs.org/zh-cn/download

### pre-requirement
## Download and install nvm:
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# cause nvm is function not command, so we need to source it
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

# Download and install Node.js:
nvm install 22

