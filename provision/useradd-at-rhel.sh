#!/usr/bin/env bash

set -e

username=$1
filename=${1/\./""}
pblickey=${2:-"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHbWEZygV6f+MENAwwP24NwGGMOqKC0XkH6DjEE7PVSA zhenhua.lei@GUI"}
base_dir=$([ -d "/mnt/disk/sub/home" ] && echo /mnt/disk/sub/home || echo /home)
echo $username $filename 
sudo useradd $username -u 9999 -m -s /bin/bash -b ${base_dir}
set +e
sudo usermod -aG wheel $username || sudo usermod -aG sudo $username
set -e
echo "$username ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/$filename
echo "Defaults:$username  timestamp_timeout=1000" | sudo tee -a /etc/sudoers.d/$filename

user_home=${base_dir}/$username
user_ssh_directory=$user_home/.ssh
user_file_auth_key=$user_ssh_directory/authorized_keys

sudo mkdir -p $user_ssh_directory
sudo chown -hR $username:$username ${user_home}
sudo touch $user_ssh_directory/authorized_keys

echo $2 | sudo tee $user_file_auth_key

sudo chown -hR $username:$username $user_file_auth_key
sudo chmod 700 ${user_home}
sudo chmod 700 $user_ssh_directory
sudo chmod 600 $user_file_auth_key

sudo passwd -d $username
sudo chage -d 0 $username
