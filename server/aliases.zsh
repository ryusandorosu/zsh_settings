alias etcgit='sudo git -C /etc'
alias bat='batcat'

if [[ $0 == unbanip && -z $1 ]]; then F2BJAIL=sshd; else F2BJAIL=$1; fi
alias unbanip='sudo fail2ban-client set $1 unbanip'
if [[ $0 == banip && -z $1 ]]; then F2BJAIL=sshd; else F2BJAIL=$1; fi
alias banip='sudo fail2ban-client set $1 banip'
if [[ $0 == banlist && -z $1 ]]; then F2BJAIL=sshd; else F2BJAIL=$1; fi
alias banlist='sudo fail2ban-client status $1'

alias banlog='sudo cat /var/log/fail2ban.log'
alias authlog='sudo cat /var/log/auth.log'
