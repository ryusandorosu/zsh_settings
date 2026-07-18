# _fzf_complete_lah() {
#   local base=$(_fzf_base_dir "$prefix")
#   if [[ $base == . ]]; then
#     _fzf_complete -- "$@" < <(fd --strip-cwd-prefix=always --type d .)
#   else
#     _fzf_complete -- "$@" < <(fd --type d . "$base")
#   fi
# }
