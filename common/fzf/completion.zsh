# compdef _du duh
# compdef _sed findsed
# compdef _apt 'apt list'

_fzf_base_dir() {
  local prefix=$1
  local base
  if [[ -z $prefix ]]; then
    base="."
  elif [[ $prefix == */ ]]; then
    base="$prefix"
  else
    base=${prefix:h}
    [[ -z "$base" ]] && base="."
  fi
  print -r -- ${~base}   # раскрыть ~
}
