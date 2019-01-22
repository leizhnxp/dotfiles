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

curl -L https://raw.githubusercontent.com/juven/maven-bash-completion/master/bash_completion.bash -o ~/.maven_bash_completion.bash
curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o ~/.docker-completion.sh
# curl -L https://raw.githubusercontent.com/git/git/v1.8.3.1/contrib/completion/git-completion.bash -o ~/.git-completion.bash

[ -d ~/.vim/bundle/Vundle.vim ] && echo need not to clone || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

refresh_dotfile vimrc
refresh_dotfile gitignore
refresh_dotfile screenrc
refresh_dotfile dir_colors

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

mkdir -p ~/bin

