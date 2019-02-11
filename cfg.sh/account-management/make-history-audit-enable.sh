#!/usr/bin/env bash

set -e
set -x

sudo curl -L https://raw.githubusercontent.com/leizhnxp/dotfiles/master/files/history-audit-profile.sh -o /etc/profile.d/system-audit.sh
sudo curl -L https://raw.githubusercontent.com/leizhnxp/dotfiles/master/files/history-audit-rsyslog.conf -o /etc/rsyslog.d/history-audit.conf

sudo systemctl restart rsyslog

