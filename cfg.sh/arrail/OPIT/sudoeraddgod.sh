#!/usr/bin/env bash

set -e

username=$1
filename=${1/\./""}
echo $username $filename 
sudo useradd $username
echo "$username ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/$filename
echo "Defaults:$username  timestamp_timeout=1000" | sudo tee -a /etc/sudoers.d/$filename

user_home=/home/$username
user_ssh_directory=$user_home/.ssh
user_file_auth_key=$user_ssh_directory/authorized_keys

sudo mkdir -p $user_ssh_directory
sudo chown -hR $username:$username /home/$username/
sudo touch $user_ssh_directory/authorized_keys

echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfXvlBAIsE4/gQIvQT/I/3ZOptPK+gvhOMDd3pCFbcm4SfYXkUtSlmumuSWoP5XHBpSsBL9ZPYPpXzMrjMn0GcvV5PGu6sX7Ehv0mHB5I/AaLgrcbYcMR+T5JilssucXp/KJFJmT292m6f8fxWlVIFwxzO16RadMI48LGhW+iUFEoyvKz3f9Q0h5VzKRj/tg0qMq+AtatjT7ccd50iRONKsuY53JcFieRHZbbtuUVIcmjP/5phUzI8hAsURE3AxJgzVp092dwvtS7Jr56ArnAkPlLSfy/qTquigLrZXfTzWCuUEmBDowX1Gv/pm5+JK3F7x1pybFmy10RMZpqTeE/X zhenhua.lei@t460 | sudo tee $user_file_auth_key

sudo chown -hR $username:$username $user_file_auth_key
sudo chmod 700 /home/$username/
sudo chmod 700 $user_ssh_directory
sudo chmod 600 $user_file_auth_key

sudo passwd -d $username
sudo chage -d 0 $username

