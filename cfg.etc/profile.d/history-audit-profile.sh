
shopt -s histappend
export HISTFILESIZE=20000
export HISTSIZE=5000
readonly HISTTIMEFORMAT='%F %T %z '
readonly HISTCONTROL=
#readonly PROMPT_COMMAND='history -a ;RETRN_VAL=$?;logger -p local6.debug { date "+%Y-%m-%d %T %z ##### $(who am i |awk "{print \$1\" \"\$2\" \"\$5}")  #### $(id|awk "{print \$1}") #### $(history 1 | { read x cmd; echo "$cmd"; })"; }'
readonly PROMPT_COMMAND='RETRN_VAL=$?;history -a;logger -p local6.debug "[$$] $(who am i) : $(history 1 | { read x cmd; echo "$cmd"; }) [$RETRN_VAL]" '

