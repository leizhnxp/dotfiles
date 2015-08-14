#!/usr/bin/env bash

osname=$(uname)
ts=`date "+%Y%m%d%H%M%S"`
mkdir -p ~/.backup/dotfiles/

refresh_dotfile(){
    echo handle symlink $1
    [ -f ~/.$1 ] && mv ~/.$1 ~/.backup/dotfiles/$1.bk.$ts
    ln -sf ~/dotfiles/files/$1 ~/.$1
}

[[ $osname == "Linux" ]] && uname -a

[ -d ~/.vim/bundle/Vundle.vim ] && echo need not to clone || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim


refresh_dotfile vimrc
refresh_dotfile gitconfig
refresh_dotfile gitignore
refresh_dotfile screenrc
refresh_dotfile dir_colors

[[ $osname == "Darwin" ]] && exit 0

refresh_dotfile bashrc
refresh_dotfile git-completion.bash

