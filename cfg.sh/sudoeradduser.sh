#!/usr/bin/env bash

username=$1
filename=${1/\./""}
echo $username $filename 
sudo useradd $username
pswd=$(openssl rand -base64 16)
echo $pswd | sudo passwd --stdin $username
echo $pswd
sudo chage -d 0 $username
echo "$username ALL=(ALL) ALL,!/usr/bin/vim /etc/sudoers,!/usr/bin/vi /etc/sudoers,!/sbin/visudo,!/usr/sbin/visudo" | sudo tee /etc/sudoers.d/$filename
echo "Defaults:$username  timestamp_timeout=1000" | sudo tee -a /etc/sudoers.d/$filename

