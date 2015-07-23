#!/usr/bin/env bash

cd ~
mkdir $whoami

sudo mv $whoami /data
ln -s /data/$whoami ~/mate
