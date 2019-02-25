#!/usr/bin/env bash

mkdir -p ~/bin

alias rm='rm -i'
alias ls='ls --color'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

HISTTIMEFORMAT="%Y%m%d-%H%M%S: "
export HISTTIMEFORMAT
export HISTSIZE=10000

export PATH=$HOME/bin:$PATH:$PH_HOME/bin

export EDITOR=vim
export LANG=en_US.UTF-8

#export TERM=xterm-256color

export PS1='[\[\033[01;32m\]\u@\H \[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]]\\$ '
#export PS1='\[\033k\033\\\]\u@\h:\w\$ '
if [ -f ~/.completion_docker-machine-prompt.bash ]; then
  source ~/.completion_docker-machine-prompt.bash
  export PS1='[\[\033[01;32m\]\u@\H \[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__docker_machine_ps1 " [%s]")]\\$ '
fi
# screen and xterm's dynamic title
case $TERM in
  xterm*)
    # Set xterm's title
    TITLEBAR='\[\e]0;\u@\h:\w\a\]'
    export PS1="${TITLEBAR}${PS1}"
    ;;
  screen*)
    # Use path as title
    PATHTITLE='\[\ek\W\e\\\]'
    # Use program name as title
    PROGRAMTITLE='\[\ek\e\\\]'
    export PS1="${PROGRAMTITLE}${PATHTITLE}${PS1}"
    ;;
  *)
    ;;
esac

type kubectl 1>&2 && source <(kubectl completion bash)
[ -f ~/.maven_bash_completion.bash ] && source ~/.maven_bash_completion.bash
[ -f ~/.completion_docker-machine.bash ] && source ~/.completion_docker-machine.bash
[ -f ~/.completion_docker-machine-wrapper.bash ] && source ~/.completion_docker-machine-wrapper.bash
[ -f ~/.docker-completion.sh ] && source ~/.docker-completion.sh
[ -f ~/.dockr-compose-completion.sh ] && source ~/.docker-compose-completion.sh
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash

