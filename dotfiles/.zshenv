#!/usr/bin/env zsh

# # ------  general  -------

#  use neovim as editor
export EDITOR=$(which nvim)

#  put config in ~/dotfiles, instead of ~/.config
export XDG_CONFIG_HOME=~/dotfiles

if command -v launchctl >/dev/null 2>&1; then
  launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME
fi

export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
SAVEHIST=$HISTSIZE
export AWS_LOG_LEVEL=3

# # ------  utility  -------

alias brew='arch -x86_64 brew'
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/checkmake:$PATH"
export PATH="$HOME/dotfiles/scripts:$PATH"
export PATH="$HOME/personal/scripts:$PATH"
