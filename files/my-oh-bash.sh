#!/usr/bin/env bash

echo hello in bash?

# only in native Linux or WSL
# Cygwin or OSX skipped
uname -a | grep Linux && ls /var/run/screen/S-$USER | xargs -i -n1 screen -S {} -X setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK

