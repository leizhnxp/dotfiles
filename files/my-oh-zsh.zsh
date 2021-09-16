echo hello omz!

# follow the first line of original zshrc?
export PATH=$HOME/bin:/usr/local/bin:$PATH

# for git commit comment editor
export EDITOR=vim

# for git branch output in same buffer, ref
# zsh original LESS=-R
unset LESS

# for ... amazing in everyday ... deprecated, to config by omz theme
# ZSH_THEME="random"

# for ssh agent forwarding on next terminal login to attach screen session
ls /var/run/screen/S-$USER | xargs -i -n1 screen -S {} -X setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK

# my favorite tools , deprecated, to config by omz plugin 
# plugins=(git mvn docker colored-man-pages)
# omz plugin enable git mvn docker colored-man-pages

