# Enable colors and change prompt:
autoload -U colors && colors

autoload -Uz compinit promptinit
compinit
promptinit


zstyle ':completion:*' menu select
_comp_options+=(globdots)

alias src="source $HOME/.zshrc"
alias ls="ls -m --color=auto"
alias cat="bat"


eval "$(starship init zsh)"

