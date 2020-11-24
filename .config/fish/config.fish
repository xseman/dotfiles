set -x LC_COLLATE "C"
set -x EDITOR nvim
set -x VEDITOR code

# fix IntelliJ apps blurr bug
set -x _JAVA_AWT_WM_NONREPARENTING 1

set -Ua fish_user_paths ~/.local/bin /usr/local/bin /usr/sbin /usr/sbin /bin

alias xclip="xclip -selection clipboard"
alias ll='ls -Flh --group-directories-first --color'
alias l='ls -Fhla --group-directories-first --color'

