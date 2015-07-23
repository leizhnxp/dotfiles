#!/usr/bin/env bash

mate_dir=`whoami`
cd ~
mkdir $mate_dir

sudo mv $mate_dir /data
ln -s /data/$mate_dir ~/mate
