#!/usr/bin/env bash

cd /opt
sudo wget http://nginx.org/packages/rhel/6/noarch/RPMS/nginx-release-rhel-6-0.el6.ngx.noarch.rpm
sudo rpm -ivh nginx-release-rhel-6-0.el6.ngx.noarch.rpm
sudo rm -rf nginx-release-rhel-6-0.el6.ngx.noarch.rpm
