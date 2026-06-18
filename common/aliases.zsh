alias digs='dig +short'
alias listen='sudo ss -tulpn | grep'
alias duh='du -ah $1 | sort -rh | head -20'
alias sed-crlf="sed -i 's/\r$//'"
alias bat='batcat'
alias lah='ls --color=tty -lah'
alias journal='sudo journalctl -u $1 | tac | grep --max-count=1 --before-context=10000 --regexp="-- Boot" | tac'
alias gitc='git -C'
