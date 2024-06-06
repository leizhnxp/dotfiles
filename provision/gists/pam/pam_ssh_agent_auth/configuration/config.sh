#!/usr/bin/env bash

# ref https://linux.die.net/man/8/pam_ssh_agent_auth

# 1. make sure the SSH_AUTH_SOCK in sudoer configuration
# 2. add the auth info to /etc/pam.d/sudo
#   + info : auth sufficient pam_ssh_agent_auth.so file=~/.ssh/authorized_keys
#   + caution : auth info must be at the beginning of the /etc/pam.d/sudo

