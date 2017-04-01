#!/usr/bin/env bash

sudo yum install -y e2fsprogs-devel libuuid-devel openssl-devel perl-devel          
sudo yum install -y glibc.i686 zlib.i686                                            
sudo yum install -y perl-XML-LibXML libncurses.so.5 perl-Crypt-SSLeay               


sudo yum install -y openssl-devel                                                   
sudo yum install -y perl-YAML perl-Devel-CheckLib gcc perl-CPAN libxml2-devel.x86_64

sudo cpan -i JSON::PP          
sudo cpan -i Fatal             
sudo cpan -f -i Class::MethodMaker

