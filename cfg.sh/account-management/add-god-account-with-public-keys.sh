#!/usr/bin/env bash

set -e

username=$1
filename=${1/\./""}
pblickey=$2
echo $username $filename 
sudo useradd $username
sudo usermod -aG wheel $username
echo "$username ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/$filename
echo "Defaults:$username  timestamp_timeout=1000" | sudo tee -a /etc/sudoers.d/$filename

user_home=/home/$username
user_ssh_directory=$user_home/.ssh
user_file_auth_key=$user_ssh_directory/authorized_keys

sudo mkdir -p $user_ssh_directory
sudo chown -hR $username:$username /home/$username/
sudo touch $user_ssh_directory/authorized_keys

echo $2 | sudo tee $user_file_auth_key

sudo chown -hR $username:$username $user_file_auth_key
sudo chmod 700 /home/$username/
sudo chmod 700 $user_ssh_directory
sudo chmod 600 $user_file_auth_key

sudo passwd -d $username
sudo chage -d 0 $username

