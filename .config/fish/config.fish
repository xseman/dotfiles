# Remove default greeting
set fish_greeting

# Keybinds
bind \cH backward-kill-word

# LS_COLORS
eval (dircolors -c ~/.dircolors)

# Aliases
alias df="df -h"
alias egrep="egrep -i --colour=auto"
alias fgrep="fgrep -i --colour=auto"
alias free="free -h"
alias temp="cd (mktemp -d)"
alias xclip="xclip -selection clipboard"
alias grep="grep -sI --color=auto"
alias ll="ls -Flh --group-directories-first --color"
alias l="ls -Fhla --group-directories-first --color"
alias ls="ls --group-directories-first --quoting-style=literal --show-control-chars --indicator-style=slash --color"
