# Oh My Zsh 自定义别名
# 此文件由 OMZ 自动从 custom 目录加载
# 加载顺序：01-base → 02-functions → 03-aliases

# Directory listing
alias llaa="ls -Al --ignore='[^.]*'"  # List only hidden files

# History with timestamps
alias hist-t="history -t '%Y-%m-%d %H:%M:%S %z'"  # Show history with ISO format timestamps and timezone

# Custom project shortcuts (customize these based on your workflow)
alias cdots="cd ~/dotfiles"
alias cwork="cd ~/workspace"

# Safety aliases
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Network utilities
alias myip="curl -s https://ipinfo.io/ip"
alias ports="netstat -tulpn"
