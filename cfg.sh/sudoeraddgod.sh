#!/usr/bin/env bash

username=$1
filename=${1/\./""}
echo $username $filename 
sudo useradd $username
sudo usermod -aG wheel
echo "$username ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/$filename
echo "Defaults:$username  timestamp_timeout=1000" | sudo tee -a /etc/sudoers.d/$filename

