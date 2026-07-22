source $ZSHREP/fzf/presets/main.sh

[[ $(alias lah) ]] && unalias lah
lah() { command /usr/bin/ls -laAh "$@"; }
laf() { command /usr/bin/ls -laAh "$@"; }
alias lah='lah --color=tty'

ffind() {
  local pattern
  [[ -z "$1" ]] && pattern="." || pattern="$1"

  preview_battree "{}"; bind_fileinfo "{}"
  fd "$pattern" '/' \
  | fzf "${fzfdefaults[@]}" \
        "${briefinfo[@]}" \
        "${previewcmd[@]}"
}

lfind() {
  local pattern
  [[ -z "$1" ]] && pattern="." || pattern="$1"

  preview_battree "{}"; bind_fileinfo "{}"
  locate -b "$pattern" \
  | fzf "${fzfdefaults[@]}" \
        "${briefinfo[@]}" \
        "${previewcmd[@]}"
}

neovim() {
  local pattern
  [[ -z "$1" ]] && pattern="." || pattern="$1"
  cmd=(locate -b "$pattern")

  preview_bat "{}"; bind_fileinfo "{}"; bind_exec nvim "{}"
  "${cmd[@]}" \
  | fzf "${fzfdefaults[@]}" \
        "${previewcmd[@]}" \
        "${briefinfo[@]}" \
        "${bindexec[@]}"
}
