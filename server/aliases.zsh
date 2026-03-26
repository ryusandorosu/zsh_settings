# common
alias etcgit='sudo git -C /etc'
alias bat='batcat'

# ansible
alias deploytag='sh /home/ryusandorosu/zsh_settings/commands/deploytag'

# fail2ban
alias banlist='sudo fail2ban-client status $1'

alias banlog='sudo cat /var/log/fail2ban.log'
alias authlog='sudo cat /var/log/auth.log'

# nftables
alias nftrules='sudo nft list table inet filter'
alias nftbanlist='sudo nft list set inet filter $1'