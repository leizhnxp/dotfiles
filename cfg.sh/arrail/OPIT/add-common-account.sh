#!/usr/bin/env bash

username=$1
filename=${1/\./""}
echo $username $filename 
sudo useradd $username
pswd=$(openssl rand -base64 16)
echo $pswd | sudo passwd --stdin $username
echo $pswd
sudo chage -d 0 $username

