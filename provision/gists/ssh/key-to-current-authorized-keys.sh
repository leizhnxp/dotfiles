#!/usr/bin/env bash

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
touch ~/.ssh/config

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod 600 ~/.ssh/config

public_key="AAAAC3NzaC1lZDI1NTE5AAAAIHbWEZygV6f+MENAwwP24NwGGMOqKC0XkH6DjEE7PVSA"

grep $public_key ~/.ssh/authorized_keys && echo exist || $(echo ssh-ed25519 $public_key zhenhua.lei@gui >> ~/.ssh/authorized_keys)

