#!/usr/bin/env bash
osname=$(uname)

mkdir -p ~/.backup/dotfiles/

repo_components_install(){
    sudo yum update -y
    sudo yum install epel-release vim git -y
}

refresh_dotfile(){
    echo handle symlink $1
    [ -f ~/.$1 ] && mv ~/.$1 ~/.backup/dotfiles/$1.bk
    ln -sf ~/dotfiles/files/$1 ~/.$1
}

[[ $osname == "Linux" ]] && repo_components_install

[ -d ~/.vim/bundle/Vundle.vim ] && echo need not to clone || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim


refresh_dotfile vimrc

[[ $osname == "Darwin" ]] && exit 0

refresh_dotfile bashrc
refresh_dotfile git-completion.bash
refresh_dotfile gitconfig

