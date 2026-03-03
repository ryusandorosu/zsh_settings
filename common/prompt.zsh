if [[ "$ZSH_THEME" == "pmcgee" ]]; then
PROMPT='%{$fg[$NAMECOLOR]%}'
PROMPT+='%n'
PROMPT+='%{$reset_color%}'
PROMPT+=' @ '
PROMPT+='%{$fg[$HOSTCOLOR]%}'
PROMPT+='%m'
PROMPT+='%{$reset_color%} '
PROMPT+='%{$fg[$PATHCOLOR]%}%B'
PROMPT+='${PWD/#$HOME/~}'
PROMPT+='%b%{$reset_color%}
$TIMEBACK'
PROMPT+='%{$fg[$TIMECOLOR]%}'
PROMPT+=' %* '
PROMPT+='%k%{$reset_color%} '
PROMPT+='$(git_prompt_info)%(!.#.$) '
RPROMPT=
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[yellow]%}"
fi