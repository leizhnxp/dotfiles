#!/usr/bin/env bash

mate_dir=`whoami`
mkdir -p ~/$mate_dir

sudo mv ~/$mate_dir /data/
ln -s /data/$mate_dir ~/mate
mkdir -p ~/mate/opt
