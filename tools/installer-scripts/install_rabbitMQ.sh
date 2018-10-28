#!/usr/bin/env bash
set -e

sudo yum install epel-release -y
sudo yum install erlang -y

[ -f /tmp/rabbitmq-server-3.6.10-1.el7.noarch.rpm ] || wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server-3.6.10-1.el7.noarch.rpm -O /tmp/rabbitmq-server-3.6.10-1.el7.noarch.rpm
sudo rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
sudo yum install /tmp/rabbitmq-server-3.6.10-1.el7.noarch.rpm -y

