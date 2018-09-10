# added by Anaconda3 5.0.1 installer
export PATH="/Users/adam/anaconda3/bin:$PATH"

# updating the history length
HISTFILESIZE=10000000
HISTSIZE=10000000

alias ll='ls -ax'
alias ls='ls -aGl'
alias awsc='aws cloudformation'
alias awscb='aws cloudformation describe-stacks --stack-name'
alias awscd='aws cloudformation delete-stack --stack-name'

alias cls='clear && ls'

alias gs='git status'
alias ga='git add -u'
alias gc='git commit -m '
alias gp='git push origin '

alias notes='git add -u && git add * && git commit -m "notes" && git push origin master'

alias ep='cd ~/git/energy-py/energypy'
alias eptest='cd ~/git/energy-py/energypy && source activate energy_py && pytest tests'
alias eptalk='cd ~/git/energy-py-talk/'

alias res='cd ~/git/research'
alias dsr='cd ~/git/dsr_rl'
alias blog='cd ~/git/adgefficiency.github.io'

alias flow='cd ~/git/flow'
alias flow='cd ~/git/flow'
alias fc='cd ~/git/forecast'

alias per='cd ~/git/personal'
alias drafts='cd ~/git/personal/drafts'
alias principles='cd ~/git/personal/drafts/principles'
alias cheat='vim ~/git/personal/lists/cheat_sheet.md'
alias actions='vim ~/git/personal/readme.md'
alias todo='vim ~/git/personal/readme.md'
alias tempus='vim ~/git/personal/projects/tempus.md'

alias bashrc='vim ~/git/dotfiles/.bash_profile'
alias vimrc='vim ~/git/dotfiles/.vimrc'
alias tmuxc='vim ~/git/dotfiles/.tmux.conf'

alias wd='cd ~/git/natural-adversary'

alias exut='exit'
alias eixt='exit'
alias exot='exit'
alias ext='exit'

alias c='clear'

quote () {
    echo
    # printing random quote
    # have to manually put in the number of lines - TODO
    # TODO use multiple files!!!
    FILE=/Users/adam/git/personal/lists/quotes_snippets.md
    X=$((1 + RANDOM % 106))
    # extract X-th line
    sed -n ${X}p ${FILE}
    echo
}

quote

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for pipenv
export PATH="/Users/adam/.local/bin:$PATH"

# changing the color of folder in ls command
# default is LSCOLORS=exfxcxdxbxegedabagacad
# http://www.marinamele.com/2014/05/customize-colors-of-your-terminal-in-mac-os-x.html
export LSCOLORS=exfxcxdxbxegedabagacad

# changing the prompt
# https://askubuntu.com/questions/123268/changing-colors-for-user-host-directory-information-in-terminal-command-prompt
# http://bashrcgenerator.com/
export PS1="\[\033[0;32m\]\u@\h\[\033[1;37m\]:\[\033[0;34m\]\w \$ \[$(tput sgr0)\]"

# updating bash history earlier
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Adding bash script folder to path
export PATH="$PATH:~/git/personal/bash"
chmod u+x ~/git/personal/bash/preview.sh
chmod u+x ~/git/personal/bash/show.sh
chmod u+x ~/git/personal/bash/add.sh
chmod u+x ~/git/personal/bash/todo.sh
export PATH="$PATH:~/git/research/aws"
chmod u+x ~/git/research/aws/spin_instance.sh
chmod u+x ~/git/research/aws/kill_instances.sh
alias spin_instance='spin_instance.sh'

st () {
    test -z "$TMUX"
    cd ~/git/personal
    tmux new-session -d -s main
    # tmux split-window -v
    tmux attach-session -t main
}

# # shell history
# . '~/git/shell-history/shellhistory.sh'
# shellhistory enable

