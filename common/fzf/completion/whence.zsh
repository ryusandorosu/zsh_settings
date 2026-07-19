_fzf_complete_whence() {
  _fzf_complete --prompt="function> " \
    --delimiter='\t' \
    --with-nth=1 \
    -- "$@" < <(
      for k in "${(@k)functions}"; do
        local body="${functions[$k]//$'\n'/\\n}"
        print -r -- "${k}"$'\t'"${body}"
      done | sort
    )
}

_fzf_complete_whence_post() {
  echo "-f"
  cut -f1
}

_fzf_complete_which() {
  _fzf_complete --prompt="which> " \
    -- "$@" < <(
      local dir
      for dir in $path; do # $PATH spelling is not recognized
        [[ "$dir" == /mnt/c/* ]] && continue
        if [[ -d "$dir" ]]; then
          # local bin="$(fd "." --type x "$dir")"
          [[ "$(fd "." --type x "$dir")" == "" ]] && continue
          # print -rl -- $(basename "$bin")
          print -rl -- ${dir}/*(N*:t)
        fi
      done | sort -u
    )
}
