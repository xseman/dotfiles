#!/bin/env fish

# Install fish package-manager
if command -v fisher >/dev/null
    echo "fish installed"
else
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Paths
set -x fish_user_paths ~/.local/bin /usr/local/bin /usr/sbin /usr/sbin /bin

# Plugins install
fisher install rafaelrinaldi/pure

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

# Prompt init start debug
# Print all your initialization stuff
# fish --profile prompt.prof -ic 'fish_prompt; exit'; sort -nk 2 prompt.prof
