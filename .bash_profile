# added by Anaconda3 5.0.1 installer
export PATH="$HOME/anaconda3/bin:$PATH"

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

alias tn='tmux new -s '
alias tl='tmux ls'

alias notes='git add -u && git add * && git commit -m "notes" && git push origin master'

alias ep='cd ~/git/energy-py/energypy'
alias eptest='cd ~/git/energy-py/energypy && source activate energy_py && pytest tests'
alias eptalk='cd ~/git/energy-py-talk/'

alias res='cd ~/git/research'
alias aw='cd ~/git/research/aws'
alias dsr='cd ~/git/dsr-rl'
alias blog='cd ~/git/adgefficiency.github.io'
alias dotfiles='cd ~/git/dotfiles'

alias flow='cd ~/git/flow'
alias fc='cd ~/git/forecast'
alias wgan='cd ~/git/AI_Safety/WGAN'
alias mcts='cd ~/git/monte_carlo_tree_search'
alias ten='cd ~/git/ten-thousand'
alias nemweb='cd ~/git/nemweb'

alias per='cd ~/git/personal'
alias drafts='cd ~/git/personal/drafts'
alias principles='cd ~/git/personal/drafts/principles'
alias cheat='vim ~/git/personal/lists/cheat_sheet.md'
alias actions='vim ~/git/personal/readme.md'
alias tempus='vim ~/git/personal/projects/tempus.md'
alias projects='cd ~/git/personal/projects'
alias adg='cd ~/git/adg/agile-data-science'

alias bashrc='vim ~/git/dotfiles/.bash_profile'
alias vimrc='vim ~/git/dotfiles/.vimrc'
alias tmuxc='vim ~/git/dotfiles/.tmux.conf'

alias wd='cd ~/git/research/env-model'

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
    FILE=$HOME/git/personal/lists/quotes_snippets.md
    X=$((1 + RANDOM % 106))
    # extract X-th line
    sed -n ${X}p ${FILE}
    echo
}

quote

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for pipenv
export PATH="$HOME/.local/bin:$PATH"

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
chmod u+x ~/git/org/src.sh
source ~/git/org/src.sh
export PATH="$PATH:~/git/research/aws"
chmod u+x ~/git/research/aws/spin_instance.sh
chmod u+x ~/git/research/aws/kill_instances.sh
alias spin_instance='spin_instance.sh'

st () {
test -z "$TMUX"
tmux new-session -d -s main -n personal -c ~/git/personal
tmux send-keys -t main:personal "cat ~/git/personal/readme.md" Enter
tmux attach -t main:personal
}

# updating the history length
HISTFILESIZE=10000000
HISTSIZE=10000000

# updating the history length
HISTFILESIZE=10000000
HISTSIZE=10000000

goo() {
   IFS=+ w3m -num https://google.com/search?hl=en\&q="$*"\&btnI= https://google.com/search?hl=en\&q="$*"
    }

# hadoop
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export HADOOP_CLASSPATH=$(hadoop classpath)
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

# spark
export PATH=$PATH:/usr/local/spark/bin
export SPARK_DIST_CLASSPATH=`$HADOOP_HOME/bin/hadoop classpath`

# mongodb
export PATH=$PATH:/usr/local/mongodb/bin
