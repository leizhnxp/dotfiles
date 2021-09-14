echo hello zsh!
# env
export EDITOR=vim

ls /var/run/screen/S-$USER | xargs -i -n1 screen -S {} -X setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK

plugins=(git,mvn,docker,colored-man-pages)

