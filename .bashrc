#!/usr/bin/env bash

# vim master race
set -o vi
export EDITOR=vim

# don't add duplicates
export HISTCONTROL=ignoreboth:erasedups

# remember a lot
export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000000
export HISTSIZE=$HISTFILESIZE
SAVEHIST=$HISTSIZE

# after each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# aws
export AWS_LOG_LEVEL=3

# fzf bash hook
[ -f ~/.fzf.bash ] && source ~/dotfiles/.fzf.bash

# pyenv
source "$HOME/dotfiles/macos/pyenv-flags"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# assuming all these been installed separately
# z script
source ~/z.sh
. "$HOME/.cargo/env"
. ~/z.sh
eval "$(zoxide init bash)"
