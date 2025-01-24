#!/usr/bin/env bash

# ref : https://nodejs.org/zh-cn/download

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

#### cause nvm is function not binary in $PATH, so we need to source it
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;

#### ==================================================================

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.13.1".
nvm current # Should print "v22.13.1".

# Verify npm version:
npm -v # Should print "10.9.2".

