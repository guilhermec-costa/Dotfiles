# Enable colors and change prompt:
autoload -U colors && colors

autoload -Uz compinit promptinit
compinit
promptinit

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


zstyle ':completion:*' menu select
_comp_options+=(globdots)

alias src="source $HOME/.zshrc"


eval "$(starship init zsh)"

