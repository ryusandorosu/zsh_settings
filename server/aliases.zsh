# common
alias etcgit='sudo git -C /etc'

# fail2ban
alias banlist='sudo fail2ban-client status $1'

alias banlog='sudo bat /var/log/fail2ban.log'
alias authlog='sudo bat /var/log/auth.log'
alias nftlog='sudo bat /var/log/nftables.log'
