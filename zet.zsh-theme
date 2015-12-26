ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[red]%} ➠ %{$reset_color%}%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[white]%}$(virtualenv_prompt_info)%{$reset_color%}%{$fg[cyan]%}%n@%m%{$reset_color%} %{$fg[green]%}%~%{$reset_color%}$(git_prompt_info) # '
