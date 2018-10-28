#!/usr/bin/env bash


#
# http://stackoverflow.com/questions/24756240/how-can-i-use-iptables-on-centos-7
#


sudo systemctl stop firewalld
sudo systemctl mask firewalld
sudo yum install iptables-services -y
sudo systemctl enable iptables
sudo systemctl restart iptables

