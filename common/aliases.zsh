alias digs='dig +short'
alias listen='sudo ss -tulpn | grep'
alias sed-crlf="sed -i 's/\r$//'"
alias bat='batcat'
alias lah='ls -lah'
alias gitc='git -C'
alias gitls='git ls-files'
alias sudo='sudo '
alias diffs='diff -sy --color'

alias gitgrep='git grep --heading --function-context --line-number'
#fzf-using aliases:
alias gitgrepf="git grep . | fzf --style=full --preview 'git grep --heading --function-context --line-number --color {3}'"
alias gitgrepb="git grep --line-number . | fzf --style=full --preview 'batcat --color=always --style=numbers --highlight-line=\$(echo {1} | cut -d: -f2) \$(echo {1} | cut -d: -f1)'"
# alias gitgrepb="git grep --line-number . | fzf --style=full --preview 'echo {1} | cut -d: -f1 | xargs -r batcat --color=always --highlight-line=$(echo {1} | cut -d: -f2)'"
alias gitlog="git log --oneline | fzf --multi --style=full --preview 'git show --color {+1}'"

alias ffind="fd . '/' | fzf --style=full --preview='fzf-preview.sh {}' --bind 'focus:+transform-header:file --brief {}'"
alias lfind="locate -b . | fzf --style=full --preview='fzf-preview.sh {}' --bind 'focus:+transform-header:file --brief {}'"
