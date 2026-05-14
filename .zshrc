OS_ID=$(grep '^ID=' /etc/os-release | cut -d= -f2)

# Main settings
export ZSH="$HOME/.oh-my-zsh"
[[ "$OS_ID" == debian ]] && ZSH_THEME="passion"
[[ "$OS_ID" == ubuntu ]] && ZSH_THEME="passion"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)
source /etc/zsh_command_not_found

# Custom settings
# cd ~/zsh_settings && git pull && cd ~ #do it only at boot
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

# source $ZSH/oh-my-zsh.sh
# ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)
