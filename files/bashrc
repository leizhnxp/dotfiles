# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color'

HISTTIMEFORMAT="%Y%m%d-%H%M%S: "
export HISTTIMEFORMAT

export GOPATH=/vagrant/gopath
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

source ~/.git-completion.bash
