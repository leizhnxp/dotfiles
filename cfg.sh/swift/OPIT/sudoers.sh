#!/usr/bin/env bash

sudo cp ~/dotfiles/cfg.etc/rsyslog.d/sudo.conf /etc/rsyslog.d/

sudo service rsyslog restart
