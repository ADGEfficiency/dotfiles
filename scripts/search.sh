#!/usr/bin/env sh

TERM_HEIGHT=$(tput lines)
MIN_HEIGHT=20

# Use provided directory or default to current directory
target_dir="${1:-.}"
cd "$target_dir" || exit

if [ "$TERM_HEIGHT" -ge "$MIN_HEIGHT" ]; then
  fzf --preview 'bat --style=numbers --color=always {}' --height 60% -m --print0 | xargs -0 $EDITOR
else
  fzf --no-preview --height 40% -m --print0 | xargs -0 $EDITOR
fi
