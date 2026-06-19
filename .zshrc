[[ -f "/etc/os-release" ]] && OS_ID=$(grep '^ID=' /etc/os-release | cut -d= -f2) || OS_ID=$(uname)

# Main settings
export ZSH="$HOME/.oh-my-zsh"
[[ "$OS_ID" == debian ]] && ZSH_THEME="passion"
[[ "$OS_ID" == ubuntu ]] && ZSH_THEME="passion"
[[ "$OS_ID" == Darwin ]] && ZSH_THEME="passion"
plugins=(git extract zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# Define user before importing sources from repo
if [[ "$(whoami)" == root ]]; then
  repo_dir="/home/$(
    cat /etc/group \
    | grep -P '\w+:\w+:\d+:(?P<user>\w+)' \
    | cut -d: -f4 \
    | uniq \
  )/zsh_settings"
else
  repo_dir="/home/$(whoami)/zsh_settings"
fi

# Custom settings
for file in "$repo_dir"/common/*.zsh; do
  source "$file"
done
case "$OS_ID" in
  debian)
    for file in "$repo_dir"/server/*.zsh; do
      source "$file"
    done
    ;;
  ubuntu)
    for file in "$repo_dir"/wsl/*.zsh; do
      source "$file"
    done
    ;;
  Darwin)
    for file in "$repo_dir"/macos/*.zsh; do
      source "$file"
    done
    ;;
esac

[[ $ZSH_THEME == "passion" ]] && source "$ZSH/themes/passion.zsh-theme"
