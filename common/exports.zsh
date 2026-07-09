export PATH=$PATH:$HOME/zsh_settings/common/commands
#ansible template renderer
export PATH=$PATH:$HOME/homeserver-ansible/tools
[[ "$OS_ID" != Darwin ]] && eval "$(fasd --init auto)"
