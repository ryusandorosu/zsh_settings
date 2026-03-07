alias etcgit='sudo git -C /etc'
alias bat='batcat'

alias unbanip='sudo fail2ban-client set $1 unbanip'
alias banip='sudo fail2ban-client set $1 banip'
alias banlist='sudo fail2ban-client status $1'

alias banlog='sudo cat /var/log/fail2ban.log'
alias authlog='sudo cat /var/log/auth.log'

alias nftbanlist='sudo nft list set inet filer $1'
alias nftrules='sudo nft list ruleset'