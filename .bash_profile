source /Users/adam/git/dotfiles/.aliases

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

alias python2=/usr/bin/python
alias python3=/usr/local/bin/python3
alias pip3=/usr/local/bin/pip3

alias vim='mvim -v'

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/adam/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/adam/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/adam/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/adam/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
