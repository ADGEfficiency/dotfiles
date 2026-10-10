#!/usr/bin/env sh

TERM_HEIGHT=$(tput lines)
MIN_HEIGHT=20

# Use provided directory or default to current directory
target_dir="${1:-.}"
cd "$target_dir" || exit

# respect local .gitignore and the global one (core.excludesFile), plus exclude ./archive
# --no-require-git applies the gitignore rules outside git repos too
FZF_DEFAULT_COMMAND='fd --type f --hidden --no-require-git --exclude .git --exclude archive'
export FZF_DEFAULT_COMMAND

if [ "$TERM_HEIGHT" -ge "$MIN_HEIGHT" ]; then
  fzf --preview 'bat --style=numbers --color=always {}' --height 60% -m --print0 | xargs -0 "$EDITOR"
else
  fzf --no-preview --height 40% -m --print0 | xargs -0 "$EDITOR"
fi
