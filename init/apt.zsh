aptinstall() {
  # [[ ! -f $(which $1) ]] && sudo apt install $1 -y
  apt-cache show $1 > /dev/null || sudo apt-get install -y $1
}

aptinstall bc               # passion theme dependency
aptinstall fasd             # fzf dependency

aptinstall command-not-found
grep -qR "update-command-not-found" ~/.zsh_history || update-command-not-found
