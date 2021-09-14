#!/usr/bin/env bash

grep ssh.github.com ~/.ssh/config && echo exist ssh.github.com in sshconfig || cat << EOF >> ~/.ssh/config

Host github.com
  User git
  Hostname ssh.github.com
  Port 443

EOF


