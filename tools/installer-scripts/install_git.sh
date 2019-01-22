#!/usr/bin/env bash

set -e

sudo yum install -y curl-devel expat-devel gettext-devel \
      openssl-devel zlib-devel libtool

sudo yum install -y asciidoc xmlto docbook2X

sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

mkdir -p ~/tmp
mkdir -p ~/bin
mkdir -p ~/opt/git
cd ~/tmp
wget https://codeload.github.com/git/git/tar.gz/v2.20.1 -O git.v2.20.1.tar.gz
tar xvf git.v2.20.1.tar.gz
cd git-2.20.1
make configure
./configure --prefix=$HOME/opt/git
make all doc info
make install install-doc install-html install-info
ln -sfT ~/opt/git/bin/git ~/bin/git
curl -L https://raw.githubusercontent.com/git/git/v2.20.1/contrib/completion/git-completion.bash -o ~/.git-completion.bash

