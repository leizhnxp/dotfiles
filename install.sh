#!/usr/bin/env bash

osname=$(uname)
ts=`date "+%Y%m%d%H%M%S"`
mkdir -p ~/.backup/dotfiles/

mkdir -p ~/opt

refresh_dotfile(){
    echo handle symlink $1
    backup_dotfile $1
    ln -sf ~/dotfiles/files/$1 ~/.$1
}

backup_dotfile(){
    [ -f ~/.$1 ] && cp ~/.$1 ~/.backup/dotfiles/$1.bk.$ts
}

[[ $osname == "Linux" ]] && uname -a

wget https://raw.githubusercontent.com/juven/maven-bash-completion/master/bash_completion.bash -O ~/.maven_bash_completion.bash
curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine.bash -o ~/.completion_docker-machine.bash
curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-wrapper.bash -o ~/.completion_docker-machine-wrapper.bash
curl -L https://raw.githubusercontent.com/docker/machine/master/contrib/completion/bash/docker-machine-prompt.bash -o ~/.completion_docker-machine-prompt.bash
# sudo curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker
# sudo curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

[ -d ~/.vim/bundle/Vundle.vim ] && echo need not to clone || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

refresh_dotfile vimrc
refresh_dotfile gitignore
refresh_dotfile screenrc
refresh_dotfile dir_colors
# refresh_dotfile bashrc
refresh_dotfile git-completion.bash

git config --global color.ui true
git config --global core.autocrlf false
git config --global core.safecrlf warn
git config --global core.excludesfile ~/.gitignore
git config --global push.default current

mkdir -p ~/.vim

if [ $osname == "Darwin" ]; then
    refresh_dotfile bash_profile
fi

backup_dotfile bashrc
grep "bashrc.my.sh" ~/.bashrc || printf "\nsource ~/dotfiles/files/bashrc.my.sh\n" >> ~/.bashrc

