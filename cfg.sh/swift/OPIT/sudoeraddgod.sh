#!/usr/bin/env bash

username=$1
filename=$2

sudo useradd $username
sudo passwd $username
echo "$username    ALL=(ALL)       ALL" > /etc/sudoers.d/$filename
