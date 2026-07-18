# Если позже захотите то же самое для which/unfunction (посмотреть, что реально скрывается за именем) — паттерн идентичный, просто источник кандидатов будет ${(k)functions} вместо ${(k)aliases}.
# _fzf_complete_unalias() {
#   _fzf_complete -- "$@" < <(print -rl -- "${(k)aliases[@]}" | sort)
# }
# _fzf_complete_alias() { _fzf_complete_unalias "$@"; }

_fzf_complete_alias() {
  _fzf_complete --prompt="alias> " \
    --delimiter='\t' \
    --with-nth=1 \
    --preview='printf "%s\n" {2}' \
    -- "$@" < <(
      for k in "${(@k)aliases}"; do
        print -r -- "${k}"$'\t'"${aliases[$k]}"
      done | sort | grep -vP '^\s+'
    )
}
_fzf_complete_alias_post()   { cut -f1; }
_fzf_complete_unalias()      { _fzf_complete_alias "$@"; }
_fzf_complete_unalias_post() { _fzf_complete_alias_post; }
