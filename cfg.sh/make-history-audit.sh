#!/usr/bin/env bash

sudo curl -L https://raw.githubusercontent.com/leizhnxp/dotfiles/master/files/history-audit-profile.sh -o /etc/profile.d/system-audit.sh

echo '* * * * * root curl https://raw.githubusercontent.com/leizhnxp/dotfiles/master/cfg.sh/history-audit-log-creation.sh | bash' | sudo tee /etc/cron.d/system-audit-log-creation

