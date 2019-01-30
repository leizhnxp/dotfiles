
shopt -s histappend
readonly HISTORY_AUDIT_FILE=/var/log/history-audit/history-audit-$(+%Y-%m-%d).log
readonly HISTFILESIZE=20000
readonly HISTSIZE=5000
readonly HISTTIMEFORMAT='%F %T %z '
readonly HISTCONTROL=
readonly PROMPT_COMMAND='history -a ;{ date "+%Y-%m-%d %T %z ##### $(who am i |awk "{print \$1\" \"\$2\" \"\$5}")  #### $(id|awk "{print \$1}") #### $(history 1 | { read x cmd; echo "$cmd"; })"; } >> $HISTORY_AUDIT_FILE'

