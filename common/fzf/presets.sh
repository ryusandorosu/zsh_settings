#!/bin/bash

get_editor() {
  local editor
  [[ -f "$(which nvim)" ]] && editor=nvim || editor=vim
  echo "$editor"
}

# options
fzfdefaults=(
  --style=full
  --preview-window='right,58%,wrap-word'
  --bind='ctrl-up:preview-up'
  --bind='ctrl-down:preview-down'
  --bind='ctrl-page-up:preview-page-up'
  --bind='ctrl-page-down:preview-page-down'
)

# binds
bind_fileinfo() {
  # file --brief --mime '$1'
  briefinfo=(
    --bind
    "focus:+transform-header:file --brief '$1'"
  )
}

bind_exec() {
  bindexec=(
    --bind
    "enter:become($1 $2)"
  )
}

# previews
_cmd_tree() {
  print -r -- "tree -C '$1' | head -500"
}

_cmd_bat() {
  local path=$1 style=$2
  print -r -- "bat $style --color=always '$path' | head -500"
}

_cmd_file_preview() {
  local path=$1 style=$2
  print -r -- "
    ft=\$(file --brief '$path')
    case \"\$ft\" in
      JSON*) jq --color-output . '$path' || $(_cmd_bat "$path" "$style") ;;
      *)     $(_cmd_bat "$path" "$style") ;;
    esac
  "
}

preview_tree() {
  previewcmd=( --preview "$(_cmd_tree "$1")" )
}

preview_bat() {
  local style=""
  [[ -n "$2" && "$2" == git ]] && style="--style=changes,numbers"
  previewcmd=( --preview "$(_cmd_file_preview "$1" "$style")" )
}

preview_battree() {
  previewcmd=(
    --preview
    "test -d '$1' && { $(_cmd_tree "$1"); } || { $(_cmd_file_preview "$1" ""); }"
  )
}

# git
preview_git() {
  local gitcommand=$1
  local select

  local repo_root=$2
  local repo_flag
  [[ -n "$repo_root" ]] && repo_flag="-C $repo_root" || repo_flag=""

  case $gitcommand in
  diff)
    local revision=$4
    [[ -z "$revision" ]] && revision=$(git $repo_flag rev-parse --abbrev-ref --symbolic-full-name @{u}) #|| revision=HEAD
    local path=$3
    [[ -n "$revision" ]] && select="'$revision' -- '$path'" || select="$path"
    ;;
  show)
    local commit=$3
    select=$commit
    ;;
  esac

  previewcmd=(
    --preview
    "git $repo_flag $gitcommand --color=always --word-diff=color $select"
    --preview-window
    'right,67%,wrap-word'
  )
}
