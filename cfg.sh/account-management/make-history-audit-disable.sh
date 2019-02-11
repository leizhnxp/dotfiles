#!/usr/bin/env bash

set -x

sudo rm -f /etc/profile.d/history-audit.sh
sudo rm -f /etc/rsyslog.d/history-audit.conf

sudo systemctl restart rsyslog

