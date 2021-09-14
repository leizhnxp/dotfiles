#!/usr/bin/env bash

echo hello in bash?

ls /var/run/screen/S-$USER | xargs -i -n1 echo screen -S {} -X setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK
ls /var/run/screen/S-$USER | xargs -i -n1 screen -S {} -X setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK

