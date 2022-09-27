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
alias grep="grep -sI --color=auto"
alias l="ls -Fhla --group-directories-first --color"
alias ll="ls -Flh --group-directories-first --color"
alias ls="ls --group-directories-first --quoting-style=literal --show-control-chars --indicator-style=slash --color"
alias temp="cd (mktemp -d)"
alias tm="tmux attach || tmux"
alias xclip="xclip -selection clipboard"
alias ip="ip -c"
alias ctop="ctop -i"
alias ctop="fd --hidden"
alias cal="ncal -M -b || cal"

if type -q "code-oss"
	alias code="code-oss || code"
end
