_fzf_complete_lah() {
  _fzf_complete -- "$@" < <(fd . '/' --type d)
}
