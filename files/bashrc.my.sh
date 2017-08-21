#!/usr/bin/env bash

alias rm='rm -i'
alias ls='ls --color'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

HISTTIMEFORMAT="%Y%m%d-%H%M%S: "
export HISTTIMEFORMAT

#export JAVA_HOME=/usr/java/default
#export M2_HOME=~/opt/apache-maven-3.3.9
#export SCALA_HOME=~/opt/scala
export PH_HOME=~/opt/arcanist
export GOPATH=~/gocode

#export PATH=$JAVA_HOME/bin:$PATH
#export PATH=$PATH:$M2_HOME/bin
#export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:$PH_HOME/bin

export EDITOR=vim

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

export LANG=en_US.UTF-8
export TERM=xterm-256color
export PS1="[\[\033[01;32m\]\u@\H \[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]]\\$ "

source ~/.maven_bash_completion.bash

