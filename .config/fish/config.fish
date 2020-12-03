set -x LC_COLLATE "C"
set -x EDITOR nvim
set -x VEDITOR code

# IntelliJ fix, UI blurr/freez
set -x _JAVA_AWT_WM_NONREPARENTING 1

alias xclip="xclip -selection clipboard"
alias ll='ls -Flh --group-directories-first --color'
alias l='ls -Fhla --group-directories-first --color'
