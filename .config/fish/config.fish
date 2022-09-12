# Remove default greeting
set fish_greeting

# Keybinds
bind \cH backward-kill-word

# LS_COLORS
eval (dircolors -c ~/.dircolors)

# Aliases
alias \
	df="df -h" \
	egrep="egrep -i --colour=auto" \
	fgrep="fgrep -i --colour=auto" \
	free="free -h" \
	grep="grep -sI --color=auto" \
	l="ls -Fhla --group-directories-first --color" \
	ll="ls -Flh --group-directories-first --color" \
	ls="ls --group-directories-first --quoting-style=literal --show-control-chars --indicator-style=slash --color" \
	temp="cd (mktemp -d)" \
	tm="tmux attach || tmux" \
	xclip="xclip -selection clipboard" \
	ip="ip -c" \
	ctop="ctop -i" \
	ctop="fd --hidden" \
	cal="ncal -M -b || cal"

if type -q "code-oss"
	alias code="code-oss || code"
end
