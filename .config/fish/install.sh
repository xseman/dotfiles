#!/usr/bin/env fish

# TODO: init.sh, find command

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Plugins
fisher install jorgebucaran/nvm.fish
fisher install PatrickF1/fzf.fish

# Configs
fish_config theme choose "Mono Lace"
fish_config prompt choose default

# Completions
# caddy completion fish > ~/.config/fish/completions/caddy.fish
# deno completions fish > ~/.config/fish/completions/deno.fish
