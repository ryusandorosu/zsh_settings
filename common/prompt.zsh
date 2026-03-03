if [[ "$ZSH_THEME" == "pmcgee" ]]; then
PROMPT='%{$fg[$NAMECOLOR]%}%n@%m%b%{$reset_color%} %{$fg[$PATHCOLOR]%}%B${PWD/#$HOME/~}%b%{$reset_color%}
$TIMEBACK%{$fg[$TIMECOLOR]%}[%*]%k%{$reset_color%} $(git_prompt_info)%(!.#.$) '
RPROMPT=
fi