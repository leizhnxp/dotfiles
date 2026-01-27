# dotfiles


如果使用stow来link，不要stow *，而是按需，并且根据目录实际情况
+ 特别是bash的尤其主要注意加-t参数，指定目标目录为~

```
# bash in debian
stow -S -d ~/dotfiles/bash -t ~/ debian
# bash in ubuntu
stow -S -d ~/dotfiles/bash -t ~/ ubuntu
# git without wsl
stow -S -d ~/dotfiles/git/ -t ~/ linux
# git with wsl
stow -S -d ~/dotfiles/git/ -t ~/ wsl
# readline
stow -S -d ~/dotfiles/ -t ~ readline

stow -S -d ~/dotfiles/vim/native -t ~

```