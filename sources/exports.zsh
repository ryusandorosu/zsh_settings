#Needed for Debian server to see command that require sudo and to zsh to highlight them correctly, without this they are painted red
if [[ -f /etc/os-release ]]; then
  if grep -q "ID=debian" /etc/os-release; then
    export PATH="$PATH:/usr/sbin:/sbin"
  fi
fi
