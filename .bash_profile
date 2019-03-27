if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# alias python2=/usr/bin/python
# alias python=/usr/local/bin/python3
# alias pip=/usr/local/bin/pip3

alias vim='mvim -v'

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

export ORG_DATA_HOME=$HOME/GoogleDrive/org-backup
source $HOME/git/org/src/org.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
