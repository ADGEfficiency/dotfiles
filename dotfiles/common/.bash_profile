#!/usr/bin/env bash

export XDG_CONFIG_HOME=~/dotfiles

if [ -e "$HOME"/.nix-profile/etc/profile.d/nix.sh ]; then . "$HOME"/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export EDITOR=$(which nvim)

eval "$(zoxide init bash)"

# pyenv
if [ "$DISABLE_PYENV" = "" ]; then
  source "$HOME/dotfiles/macos/pyenv-flags"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

{ eval "$(ssh-agent)"; } &>/dev/null
eval "$(direnv hook bash)"
. ~/.keychain/"$(uname -n)"-sh

# if running bash
if [ "$BASH_VERSION" != "" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi
