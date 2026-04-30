# common
alias etcgit='sudo git -C /etc'
alias bat='batcat'

# ansible
alias deploytag='sh /home/ryusandorosu/zsh_settings/commands/deploytag'

# fail2ban
alias banlist='sudo fail2ban-client status $1'

alias banlog='sudo batcat /var/log/fail2ban.log'
alias authlog='sudo batcat /var/log/auth.log'
alias nftlog='sudo batcat /var/log/kern.log | grep nft'
