for file in $ZSHREP/fzf/presets/*/*.sh; do source "$file"; done

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
    "focus:+transform-header:
    file --brief '$1'
    "
  )
}

bind_gitinfo() {
  local repo_root=$1
  local path=$2
  local repo_flag
  [[ -n "$repo_root" ]] && repo_flag="-C $repo_root" || repo_flag=""
  briefinfo=(
    --bind
    "focus:+transform-header:
    __status='$3'
    case \"\$__status\" in
      '??') print 'untracked' ;;
      *)    git $repo_flag diff-files --stat -- '$path' ;;
    esac
    "
  )
}

bind_exec() {
  bindexec=(
    --bind
    "enter:become($1 $2)"
  )
}

_get_editor() {
  local editor
  [[ -f "$(which nvim)" ]] && editor=nvim || editor=vim
  echo "$editor"
}
