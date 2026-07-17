rootlink() {
  local source=$1
  local link=$2
  [[ ! -L $link ]] || [[ $(readlink $link) != $source ]] && {
    ln -fs $source $link
  }
}

if [[ "$(whoami)" == root ]]; then

  [[ $SHELL != $(which zsh) ]] && chsh -s $(which zsh)
  ZSH_DISABLE_COMPFIX=true

  default_homedir=$(grep -P "\w+:x:1000" /etc/passwd | grep -oP "/home/\w+")
  rootlink $default_homedir/.oh-my-zsh /root/.oh-my-zsh
  rootlink $ZSHREP "/root/$(basename $ZSHREP)"

fi
