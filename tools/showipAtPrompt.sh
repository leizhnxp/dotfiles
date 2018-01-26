#!/usr/bin/env bash

export PS1='[\[\033[01;32m\]\u@$(ip a |grep inet |grep -v -E "inet6|docker|br-|host lo" | awk "{print \$2}") \[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__docker_machine_ps1 " [%s]")]\\$ '

