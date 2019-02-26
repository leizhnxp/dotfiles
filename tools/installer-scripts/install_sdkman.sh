#!/usr/bin/env bash

type yum && sudo yum install zip unzip -y || sudo apt install zip unzip -y

curl -s "https://get.sdkman.io" | bash

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk version

