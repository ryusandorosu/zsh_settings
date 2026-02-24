# Main settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="pmcgee"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# Custom settings
cd ~/zsh_settings && git pull && cd ~
OS_ID=$(grep '^ID=' /etc/os-release | cut -d= -f2)
for file in ~/zsh_settings/common/*.zsh; do
  source "$file"
done
case "$OS_ID" in
  debian)
    for file in ~/zsh_settings/server/*.zsh; do
      source "$file"
    done
    ;;
  ubuntu)
    for file in ~/zsh_settings/wsl/*.zsh; do
      source "$file"
    done
    ;;
esac
