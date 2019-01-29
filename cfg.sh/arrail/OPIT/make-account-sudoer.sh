#!/usr/bin/env bash

username=$1
filename=${1/\./""}
echo $username $filename
echo "$username ALL=(ALL) /usr/bin/whoami,/bin/ls /*" | sudo tee /etc/sudoers.d/$filename
# never do like blow ...
# echo "$username ALL=(ALL) ALL,!/usr/bin/vim /etc/sudoers,!/usr/bin/vi /etc/sudoers,!/sbin/visudo,!/usr/sbin/visudo,!/usr/bin/passwd,!/usr/bin/su,!/usr/bin/bash" | sudo tee /etc/sudoers.d/$filename
echo "Defaults:$username  timestamp_timeout=10" | sudo tee -a /etc/sudoers.d/$filename

