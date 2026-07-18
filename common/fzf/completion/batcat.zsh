# _fzf_complete_cat() {
#   local base=$(_fzf_base_dir "$prefix")
#   if [[ $base == . ]]; then
#     _fzf_complete -- "$@" < <(fd --strip-cwd-prefix=always --type f .)
#   else
#     _fzf_complete -- "$@" < <(fd --type f . "$base")
#   fi
# }

# _fzf_complete_bat() { _fzf_complete_cat "$@"; }
# _fzf_complete_batcat() { _fzf_complete_cat "$@"; }
