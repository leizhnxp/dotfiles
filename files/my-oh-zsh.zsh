echo hello omz! \[AT\] `date` \[ON\] `uname -a`

# fix the term color https://github.com/zsh-users/zsh-autosuggestions/issues/229
export TERM=xterm-256color

# follow the first line of original zshrc?
export PATH=HOME/bin:/$HOME/.local/bin:$usr/local/bin:$PATH

# for git commit comment editor
export EDITOR=vim

# for git branch output in same buffer, ref
# zsh original LESS=-R
unset LESS

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

function wsl2_pageant(){
  export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
  if ! ss -a | grep -q "$SSH_AUTH_SOCK"; then
    rm -f "$SSH_AUTH_SOCK"
    wsl2_ssh_pageant_bin="$HOME/.ssh/wsl2-ssh-pageant.exe"
    if test -x "$wsl2_ssh_pageant_bin"; then
      (setsid nohup socat UNIX-LISTEN:"$SSH_AUTH_SOCK,fork" EXEC:"$wsl2_ssh_pageant_bin" >/dev/null 2>&1 &)
    else
      echo >&2 "WARNING: $wsl2_ssh_pageant_bin is not executable."
    fi
    unset wsl2_ssh_pageant_bin
  fi
}

uname -a | grep WSL2 && wsl2_pageant

