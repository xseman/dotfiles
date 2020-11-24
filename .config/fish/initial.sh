#!/bin/env fish

# Easy web-based colors configuration command:
# fish_config

# Install fish package-manager
if command -v fisher >/dev/null
    echo "fish installed"
else
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end

# Plugins install
fisher add rafaelrinaldi/pure
fisher add decors/fish-colored-man

# Colored Manpage config
set -g man_blink -o red
set -g man_bold -o black
set -g man_standout -b white 586e75
set -g man_underline -u 586e75

# Prompt config
set fish_color_command "#3f953a"
set fish_color_param "#2f5af3"
set fish_color_search_match --background="#808080"

# Pure
set pure_color_primary "#2f5af3"
set pure_color_success "#3f953a"

set pure_symbol_prompt ">"
set pure_symbol_reverse_prompt "<"
set pure_symbol_git_unpulled_commits "⇣"
set pure_symbol_git_unpushed_commits "⇡"
set pure_symbol_git_dirty "*"

# Autocomplete
#
# docker:                       https://github.com/docker/cli/blob/master/contrib/completion/fish/docker.fish
# docker-compose:               https://github.com/docker/compose/blob/master/contrib/completion/fish/docker-compose.fish
# other docker/docker-compose:  https://github.com/halostatue/fish-docker/tree/master/completions
# deno:                         deno completions fish > deno.fish
