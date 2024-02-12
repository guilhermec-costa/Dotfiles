# Enable colors and change prompt:
autoload -Uz compinit promptinit
compinit
promptinit

autoload -U colors && colors
zstyle ':completion:*' menu select
_comp_options+=(globdots)


