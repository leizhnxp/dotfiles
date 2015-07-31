find /proc/sys/net/ipv4/ -type f|xargs -n1 -i sh -c "echo -ne {}' \t '  ; cat {} "|grep tw
