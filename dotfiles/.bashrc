#!/usr/bin/env bash

# vim master race
set -o vi
export EDITOR=vim

# don't add duplicates
export HISTCONTROL=ignoreboth:erasedups

# remember a lot
export HISTFILE=~/.bash_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
SAVEHIST=$HISTSIZE

# after each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# aws
export AWS_LOG_LEVEL=3

# load my functions and aliases
source "$HOME"/dotfiles/scripts/funcs.sh
source "$HOME"/dotfiles/scripts/aliases.sh

# fzf bash hook
source "$HOME"/dotfiles/dotfiles/.fzf.bash

# assuming all these been installed separately
# z script
source ~/dotfiles/dotfiles/z.sh
# not sure i need this really
# . "$HOME/.cargo/env"

export PATH="$HOME/dotfiles/scripts:$PATH"
source "$HOME/dotfiles/scripts/funcs.sh"
source "$HOME/dotfiles/scripts/aliases.sh"

export XDG_CONFIG_HOME=~/dotfiles
export EDITOR=$(which nvim)

eval "$(ssh-agent -s)"
