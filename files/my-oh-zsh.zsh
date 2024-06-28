echo hello omz! \[AT\] `date` \[ON\] `uname -a`

# follow the first line of original zshrc?
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# fix the term color https://github.com/zsh-users/zsh-autosuggestions/issues/229
# export TERM=xterm-256color
# https://stackoverflow.com/questions/18600188/home-end-keys-do-not-work-in-tmux
# export TERM=screen-256color
# ---
# using oh my tmux plugin instead
# ---

# for git commit comment editor
export EDITOR=vim

# for git branch output in same buffer, ref
# zsh original LESS=-R
unset LESS

# for gh copilot alias
# ref https://docs.github.com/en/copilot/github-copilot-in-the-cli/using-github-copilot-in-the-cli
type gh && eval "$(gh copilot alias -- zsh)"

# for ... amazing in everyday ... deprecated, to config by omz theme
# ZSH_THEME="random"

## DEPRECATED screen package is removed in RHEL 8
## https://access.redhat.com/solutions/4136481
# for ssh agent forwarding on next terminal login to attach screen session
# but to skip on Cygwin and OSX
# uname -a | grep Linux && ls /var/run/screen/S-$USER | xargs -i -n1 screen -S {} -X setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK

# my favorite tools , deprecated, to config by omz plugin 
# plugins=(git mvn docker colored-man-pages)
# omz plugin enable git mvn docker colored-man-pages

