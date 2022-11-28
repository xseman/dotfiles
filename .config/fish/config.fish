# Remove default greeting
set fish_greeting

# Paths
set -x fish_user_paths \
	~/.deno/bin \
	~/.local/bin \
	~/go/bin \
	/usr/local/go/bin \
	/usr/local/bin \
	/usr/sbin \
    /bin \

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
