source $ZSHREP/fzf/presets/main.sh

# similar to glgp alias
gitlog() {
  gitcmd=(git)
  if   [[ -d "$1" ]]; then gitcmd+=(-C "$1");
  elif [[ -f "$1" ]]; then gitcmd+=(-C "$(dirname $1)"); fi
  if   [[ -n "$1" ]]; then repo_path="$("${gitcmd[@]}" rev-parse --show-toplevel)"; fi

  gitcmd+=(
    log
    --oneline
  )

  preview_git show "$repo_path" "{+1}"
  "${gitcmd[@]}" | fzf "${fzfdefaults[@]}" "${previewcmd[@]}" --multi
}
alias gitshow='gitlog'
