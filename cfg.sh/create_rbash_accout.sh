#!/usr/bin/env bash

set -e

sudo ln -sf /bin/bash /bin/rbash
username=$1
sudo useradd -s /bin/rbash $username
pswd=$(openssl rand -base64 16)
echo $pswd | sudo passwd --stdin $username
echo $pswd
sudo chage -d 0 $username

user_home=/home/$username
user_ssh_directory=$user_home/.ssh
user_file_auth_key=$user_ssh_directory/authorized_keys

user_home=/home/$username
user_ssh_directory=$user_home/.ssh
user_file_auth_key=$user_ssh_directory/authorized_keys

sudo mkdir -p $user_ssh_directory
sudo chown -hR $username:$username /home/$username/
sudo chown -R root:$username /home/$username/.bashrc /home/$username/.bash_profile
sudo chmod 640 /home/$username/.bashrc /home/$username/.bash_profile
sudo touch $user_ssh_directory/authorized_keys

sudo mkdir -p /home/$username/bin

echo "export PATH=/home/$username/bin" | sudo tee -a /home/$username/.bash_profile

sudo ln -sf /usr/bin/ssh /home/$username/bin/ssh

sudo chown -hR $username:$username $user_file_auth_key
sudo chmod 700 /home/$username/
sudo chmod 700 $user_ssh_directory
sudo chmod 600 $user_file_auth_key


