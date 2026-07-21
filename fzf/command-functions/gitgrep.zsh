source $ZSHREP/fzf/presets/main.sh

# git diff --name-only; git diff --compact-summary; --color-moved=default; --diff-algorithm=default; --find-renames
# ^ same for git show ^, may be useful for gitlog.zsh / preview_git()
# idk why $repo_path substitution in cmd array and separately as a variable doesnt work properly in these functions unlike in gitadd/gitvim. sort out it later.

gitgrepf() {
  gitcmd=(git)
  if   [[ -d "$1" ]]; then gitcmd+=(-C "$1");
  elif [[ -f "$1" ]]; then gitcmd+=(-C "$(dirname $1)"); fi
  repo_path="$("${gitcmd[@]}" rev-parse --show-toplevel)/"

  gitcmd+=(grep)
  cmd=("${gitcmd[@]}")
  cmd+=(".")

  "${cmd[@]}" | \
  fzf "${fzfdefaults[@]}" \
  --preview ''${(j: :)gitcmd[@]}' --heading --function-context --line-number --color {3}'
   # --function-context: is exclusive with --*context flags
}

gitgrepb() {
  gitcmd=(git)
  if   [[ -d "$1" ]]; then gitcmd+=(-C "$1");
  elif [[ -f "$1" ]]; then gitcmd+=(-C "$(dirname $1)"); fi
  repo_path="$("${gitcmd[@]}" rev-parse --show-toplevel)/"

  gitcmd+=(
    grep
    --line-number
    "."
  )

  "${gitcmd[@]}" | \
  fzf "${fzfdefaults[@]}" \
  --preview 'bat --color=always --style=changes,numbers --highlight-line=$(cut -d: -f2 <<< {1}) '$repo_path'$(cut -d: -f1 <<< {1})'
}
