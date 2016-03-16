#!/usr/bin/env bash

username=$1
filename=${1/\./""}
echo $username $filename 
sudo useradd $username
echo "$username ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/$filename
