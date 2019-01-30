#!/usr/bin/env bash

mkdir -p /var/log/history-audit/

FILE_TDY=/var/log/history-audit/$(date +%Y-%m-%d).log
FILE_TMR=/var/log/history-audit/$(date +%Y-%m-%d -d tomorrow).log
FILE_DTM=/var/log/history-audit/$(date +%Y-%m-%d -d "-2 days ago").log

touch $FILE_TDY $FILE_TMR $FILE_DTM

chown nobody:nobody $FILE_TDY $FILE_TMR $FILE_DTM

chmod 002 $FILE_TDY $FILE_TMR $FILE_DTM
chattr +a $FILE_TDY $FILE_TMR $FILE_DTM


