export FZF_CTRL_T_COMMAND="" # used in wezterm

export FZF_ALT_C_OPTS="
  --style full
  --walker dir,follow,hidden
  --walker-skip .git,.include,.cache,.vscode-server,'.local/lib',node_modules,target
  --walker-root '.' '$HOME' 
  --prompt 'cd> '
  --preview 'tree -C {}'"
