highlight_color="#d7af87"
ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets pattern )
ZSH_HIGHLIGHT_STYLES[command]="fg=$highlight_color"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$highlight_color"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$highlight_color"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path]='fg=white'
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
