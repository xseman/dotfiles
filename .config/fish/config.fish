# Remove default greeting
set fish_greeting

# envs
set -x LESS_TERMCAP_mb (printf "\e[34m")
set -x LESS_TERMCAP_md (printf "\e[1;30m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[30;43m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[32m")

# Paths v3.2.0
fish_add_path ~/.local/bin \
fish_add_path ~/.deno/bin \
fish_add_path ~/go/bin \

fish_add_path /usr/local/go/bin \
fish_add_path /usr/local/bin \
fish_add_path /usr/sbin \
fish_add_path /bin \

# Keybinds
bind \cH backward-kill-word

# LS_COLORS
eval (dircolors -c ~/.dircolors)

# Aliases
alias cal="ncal -M -b"
alias ctop="ctop -i"
alias df="df -h"
alias egrep="egrep -i --colour=auto"
alias fd="fd --hidden"
alias fgrep="fgrep -i --colour=auto"
alias free="free -h"
alias grep="grep -sI --color=auto"
alias ip="ip -c"
alias l="ls -Fhla --group-directories-first --color"
alias ll="ls -Flh --group-directories-first --color"
alias ls="ls --group-directories-first --quoting-style=literal --show-control-chars --indicator-style=slash --color"
alias temp="cd (mktemp -d)"
alias tm="tmux attach || tmux"
alias xclip="xclip -selection clipboard"

if type -q "code-oss"
	alias code="code-oss"
end
