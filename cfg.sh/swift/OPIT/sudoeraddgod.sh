#!/usr/bin/env bash

username=$1
filename=$2

sudo useradd $username
sudo passwd $username
echo "$username ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/$filename
