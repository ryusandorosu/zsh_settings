#!/bin/bash

get_editor() {
  local editor
  [[ -f "$(which nvim)" ]] && editor=nvim || editor=vim
  echo "$editor"
}

# options
fzstyle=(
  --style=full
)

# binds
bind_fileinfo() {
  briefinfo=(
    --bind
    "focus:+transform-header:file --brief $1"
  )
}

# bind_fileinfo_escaped() {
#   file_brief=(
#     --bind
#     \'focus:+transform-header:file --brief "$1"\'
#   )
# }

bind_exec() {
  bindexec=(
    --bind
    "enter:become($1 $2)"
  )
}
# bind_exec_escaped() {
#   bindexec=(
#     --bind
#     \'enter:become\("$1" "$2"\)\'
#   )
# }

# previews
tree_view=(
  --preview
  'tree -C {} | head -200'
)

previef_simple() {
  previef=(
    --preview
    "batcat --color=always $1"
  )
}

previef_git() {
  previef=(
    --preview
    "batcat --style=changes,numbers --color=always $1"
  )
}
# previef_git_escaped() {
#   previef=(
#     --preview
#     \'batcat --style=changes,numbers --color=always $1\'
#   )
# }

git_diff_view() {
  [[ -n "$1" ]] && local repo_root="-C $1" || local repo_root=""
  previef=(
    --preview
    "git $repo_root diff --color=always --word-diff=color $2"
  )
  # \'git $repo_root diff --color=always --word-diff=color $2\'
}
