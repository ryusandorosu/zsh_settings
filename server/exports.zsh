export PATH=$PATH:$HOME/zsh_settings/server/commands
#Needed for Debian server to see command that require sudo and to zsh to highlight them correctly, without this they are painted red
export PATH="$PATH:/usr/sbin:/sbin"
# Created by `pipx` on 2026-03-02 18:33:34
export PATH="$PATH:/home/ryusandorosu/.local/bin"
#Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
#for wezterm
function osc7_pwd() {
  printf '\e]7;file://%s%s\e\\' "$HOST" "$PWD"
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd osc7_pwd
add-zsh-hook precmd osc7_pwd
