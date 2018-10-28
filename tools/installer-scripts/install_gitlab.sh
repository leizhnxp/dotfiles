#!/usr/bin/env bash

sudo yum install curl openssh-server postfix cronie -y
sudo service postfix start
sudo chkconfig postfix on
sudo lokkit -s http -s ssh

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo yum install gitlab-ce -y

sudo gitlab-ctl reconfigure
