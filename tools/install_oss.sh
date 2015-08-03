#!/usr/bin/env bash

cd
mkdir -p ~/oss/
mkdir -p ~/bin/
cd ~/oss/
wget $1 -O OSS_Python_API.zip
unzip OSS_Python_API.zip
ln -s ~/oss/osscmd ~/bin/osscmd

