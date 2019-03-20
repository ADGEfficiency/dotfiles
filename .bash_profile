# added by Anaconda3 5.0.1 installer
export PATH="$HOME/anaconda3/bin:$PATH"

source /Users/adam/git/dotfiles/.aliases

quote () {
    QUOTES=$HOME/git/personal/lists/quotes_snippets.md
    NUM_LINES=$(wc -l $QUOTES | awk '{print $1'})
    LINE=$((1 + RANDOM % $NUM_LINES))
    sed -n ${LINE}p ${QUOTES}
}

function cheat_unix() {
  curl cht.sh/$1
}

echo
quote
echo
quote
echo

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

# updating the history length
export HISTFILESIZE=10000000
export HISTSIZE=10000000

# append history entries..
shopt -s histappend

export HISTCONTROL=ignoredups:erasedups

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Adding bash script folder to path
export PATH="$PATH:~/git/personal/bash"
export PATH="$PATH:~/git/research/aws"
chmod u+x ~/git/research/aws/spin_instance.sh
chmod u+x ~/git/research/aws/kill_instances.sh
alias spin_instance='spin_instance.sh'

goo() {
   IFS=+ w3m -num https://google.com/search?hl=en\&q="$*"\&btnI= https://google.com/search?hl=en\&q="$*"
    }

# AGILE DATA SCIENCE SETUP
export PROJECT_HOME=/Users/adam/git/adg

# Hadoop environment setup
export HADOOP_HOME=$PROJECT_HOME/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export HADOOP_CLASSPATH=$(hadoop classpath)
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

# Spark environment setup
export SPARK_HOME=$PROJECT_HOME/spark
export HADOOP_CONF_DIR=$PROJECT_HOME/hadoop/etc/hadoop/
export SPARK_DIST_CLASSPATH=`$HADOOP_HOME/bin/hadoop classpath`
export PATH=$PATH:$SPARK_HOME/bin
export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH
export PATH=$PATH:$PROJECT_HOME/mongodb/bin

#  pymongo setup
export PYTHONPATH=$PYTHONPATH:$PROJECT_HOME/lib

alias startadg='bash ~/git/adg/start-dev-server'
chmod u+x $PROJECT_HOME/start-dev-server

alias startper='bash ~/git/personal/start-personal'
chmod u+x ~/git/personal/start-personal

#  tempus
export RESEARCH_DIR=/Users/adam/git/research

#  org
export ORG_HOME="/Users/adam/git/org"
export ORG_DATA_HOME="/Users/adam/GoogleDrive/org-backup"
source $ORG_HOME/src/org.sh
