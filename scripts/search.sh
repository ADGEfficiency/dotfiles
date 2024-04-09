#!/usr/bin/env sh

TERM_HEIGHT=$(tput lines)
MIN_HEIGHT=20

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

cd "$1" || exit

if [ "$TERM_HEIGHT" -ge "$MIN_HEIGHT" ]; then
  files=$(fzf --preview 'bat --style=numbers --color=always {}' --height 60% -m)
else
  files=$(fzf --no-preview --height 40% -m)
fi

if [ $? -eq 0 ]; then
  # Open selected files with the preferred editor
  open_files_with_editor "$files"
fi
