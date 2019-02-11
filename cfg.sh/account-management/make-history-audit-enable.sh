#!/usr/bin/env bash

set -e
set -x

sudo curl -L https://raw.githubusercontent.com/leizhnxp/dotfiles/master/cfg.etc/profile.d/history-audit-profile.sh -o /etc/profile.d/history-audit.sh
sudo curl -L https://raw.githubusercontent.com/leizhnxp/dotfiles/master/cfg.etc/rsyslog.d/history-audit-rsyslog.conf -o /etc/rsyslog.d/history-audit.conf

sudo systemctl restart rsyslog

