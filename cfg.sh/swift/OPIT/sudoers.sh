#!/usr/bin/env bash

sudo cp /home/zhenhua.lei/dotfiles/cfg.etc/sudoers.d/leizhenhua /etc/sudoers.d/
sudo cp /home/zhenhua.lei/dotfiles/cfg.etc/rsyslog.d/sudo.conf /etc/rsyslog.d/
sudo service rsyslog restart
