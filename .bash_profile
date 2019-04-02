#!/usr/bin/env bash

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# alias python2=/usr/bin/python
# alias python=/usr/local/bin/python3
# alias pip=/usr/local/bin/pip3

alias vim='mvim -v'
alias gdrive='cd "$HOME/GoogleDrive"'

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

source $HOME/git/org/org

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

quote () {
    QUOTES=$HOME/git/personal/lists/quotes_snippets.md
    NUM_LINES=$(wc -l $QUOTES | awk '{print $1'})
    LINE=$((1 + RANDOM % $NUM_LINES))
    echo $(sed -n ${LINE}p ${QUOTES})
}
echo
quote
echo
quote
echo

source ~/website/.bashrc
