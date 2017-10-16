#!/usr/bin/env bash

sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
sudo bash -c "cat > /etc/yum.repos.d/logstash.repo" <<EOF
[logstash-5.x]
name=Elastic repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

sudo yum install logstash -y

