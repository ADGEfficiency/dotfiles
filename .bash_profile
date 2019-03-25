if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

# alias python2=/usr/bin/python
# alias python=/usr/local/bin/python3
# alias pip=/usr/local/bin/pip3

alias vim='mvim -v'

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

