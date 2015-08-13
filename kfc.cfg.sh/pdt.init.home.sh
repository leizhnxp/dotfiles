#!/usr/bin/env bash

mate_dir=`whoami`
mkdir -p ~/$mate_dir

sudo mv ~/$mate_dir /home/admin/
ln -s /home/admin/$mate_dir ~/mate
mkdir -p ~/mate/opt

