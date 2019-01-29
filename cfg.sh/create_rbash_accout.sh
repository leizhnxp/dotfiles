#!/usr/bin/env bash

set -e

sudo ln -sf /bin/bash /bin/rbash
username=$1
sudo useradd -s /bin/rbash $username
pswd=$(openssl rand -base64 16)
echo $pswd | sudo passwd --stdin $username
echo $pswd
sudo chage -d 0 $username

