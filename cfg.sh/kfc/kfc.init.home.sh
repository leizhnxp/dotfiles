#!/usr/bin/env bash

mate_dir=`whoami`.mate
mkdir -p ~/$mate_dir

sudo mv ~/$mate_dir /data/
ln -sf /data/$mate_dir ~/mate
mkdir -p ~/mate/opt
mkdir -p ~/mate/projects
mkdir -p ~/mate/m2
rm -rf ~/.m2/
ln -sf ~/mate/m2 ~/.m2
