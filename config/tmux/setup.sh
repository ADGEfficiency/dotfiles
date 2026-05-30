#!/usr/bin/env bash
# tmux is installed with homebrew
URL=https://github.com/tmux-plugins/tpm
FOLDER=~/.tmux/plugins/tpm
if [ ! -d "$FOLDER" ] ; then
  git clone "$URL" "$FOLDER"
fi
