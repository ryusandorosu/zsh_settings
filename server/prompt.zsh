custom_hostname='nuc-server'
#%m for short hostname, %M for full hostname
if [[ "$ZSH_THEME" == "pmcgee" ]]; then
PROMPT='%{$fg[$NCOLOR]%}%B%n@$custom_hostname%b%{$reset_color%} %{$fg[white]%}%B${PWD/#$HOME/~}%b%{$reset_color%}
$(git_prompt_info)%(!.#.$) '
RPROMPT='[%*]'
fi