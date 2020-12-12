set -x LC_COLLATE "C"
set -x EDITOR nvim
set -x VEDITOR code

# Paths
set -x fish_user_paths ~/.local/bin ~/.deno/bin /usr/local/bin /usr/sbin /usr/sbin /bin

# IntelliJ fix, UI blurr/freez
set -x _JAVA_AWT_WM_NONREPARENTING 1

# Keybinds
bind \cH backward-kill-word

alias xclip="xclip -selection clipboard"
alias ll='ls -Flh --group-directories-first --color'
alias l='ls -Fhla --group-directories-first --color'
