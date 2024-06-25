#!/usr/bin/env bash

osname=$(uname)
ts=`date "+%Y%m%d%H%M%S"`
mkdir -p ~/.backup/dotfiles/

refresh_dotfile(){
    echo handle symlink $1
    backup_dotfile $1
    ln -sf ~/dotfiles/files/$1 ~/.$1
}


backup_dotfile(){
    [ -f ~/.$1 ] && cp ~/.$1 ~/.backup/dotfiles/$1.bk.$ts
}

is_cygwin(){
  uname -a | grep CYGWIN
}

is_linux(){
  uname -a | grep Linux
}

install_vundle_in_cygwin(){

  mkdir -p ~/.vim/bundle
  
  cd ~/.vim/bundle

  git clone https://github.com/VundleVim/Vundle.vim.git

  cd -
}

install_vim_vundle(){
  is_cygwin && install_vundle_in_cygwin || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

[[ $osname == "Linux" ]] && uname -a

#curl -L https://raw.githubusercontent.com/juven/maven-bash-completion/master/bash_completion.bash -o ~/.maven_bash_completion.bash
#curl -L https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o ~/.docker-completion.sh
#curl -L https://raw.githubusercontent.com/git/git/v1.8.3.1/contrib/completion/git-completion.bash -o ~/.git-completion.bash

mkdir -p ~/bin
mkdir -p ~/opt
mkdir -p ~/workspace
mkdir -p ~/tmp

[ -d ~/.vim/bundle/Vundle.vim ] && echo need not to clone vundle || install_vim_vundle

pwd

refresh_dotfile vimrc
refresh_dotfile gitignore
# refresh_dotfile screenrc
# refresh_dotfile dir_colors

mkdir -p ~/.config/git/ \
   && test -e ~/dotfiles/confs/git-allowed_signers \
   && ln -sf ~/dotfiles/confs/git-allowed_signers ~/.config/git/allowed_signers

git config --global gpg.ssh.allowedSignersFile "~/.config/git/allowed_signers"
git config --global gpg.format ssh
git config --global user.signingkey "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHbWEZygV6f+MENAwwP24NwGGMOqKC0XkH6DjEE7PVSA"

git config --global color.ui true
git config --global core.autocrlf false
git config --global core.excludesfile ~/.gitignore
# git config --global push.default current
# git config --global core.safecrlf warn


if [ $osname == "Darwin" ]; then
    refresh_dotfile bash_profile
fi

# bashrc custom
backup_dotfile bashrc
grep "bashrc.my.sh" ~/.bashrc || printf "\nsource ~/dotfiles/files/bashrc.my.sh\n" >> ~/.bashrc
grep "my-oh-bash.sh" ~/.bashrc || printf "\nbash ~/dotfiles/files/my-oh-bash.sh\n" >> ~/.bashrc

# omz custom
ln -sf ~/dotfiles/files/my-oh-zsh.zsh ~/.oh-my-zsh/custom/my-oh-zsh.zsh

