#!/usr/bin/env bash

mkdir -p /vagrant_data/m2
mkdir -p /vagrant_data/ivy2
ln -sfT /vagrant_data/m2 ~/.m2
ln -sfT /vagrant_data/ivy2 ~/.ivy2
ln -sfT /vagrant_data ~/mate

sudo usermod -aG vagrant $(whoami)
