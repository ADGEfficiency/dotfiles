#!/usr/bin/env sh

# Ensure compatibility for Bash and Zsh
# This script uses common POSIX syntax to ensure it works across both shells.

TERM_HEIGHT=$(tput lines)
MIN_HEIGHT=20

# Function to execute editor with files, ensuring it works across different shells
open_files_with_editor() {
  if [ "$BASH_VERSION" != "" ]; then
    # Bash-specific way to handle files
    eval "$EDITOR" "$@"
  elif [ "$ZSH_VERSION" != "" ]; then
    # Zsh-specific way to handle array arguments
    eval "$EDITOR" "${(q)@}"
  else
    # Fallback for other POSIX-compliant shells
    eval "$EDITOR" "$@"
  fi
}

# Using fzf to select files
# Adjust fzf options for preview based on terminal size
if [ "$TERM_HEIGHT" -ge "$MIN_HEIGHT" ]; then
  files=$(fzf --preview 'bat --style=numbers --color=always {}' --height 60% -m)
else
  files=$(fzf --no-preview --height 40% -m)
fi

# Check if fzf selection was successful
if [ $? -eq 0 ]; then
  # Open selected files with the preferred editor
  open_files_with_editor "$files"
fi
