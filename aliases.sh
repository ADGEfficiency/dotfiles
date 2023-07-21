#!/usr/bin/env bash

export todo=$HOME/personal/todo.md
export vimrc=$HOME/dotfiles/.vimrc
export CHEAT=$HOME/personal/lists/cheat_sheet.md
export PER=$HOME/personal/
export GDR=$HOME/GoogleDrive

alias v='$EDITOR Makefile README.md'
alias vi='$EDITOR'
alias vimrc='$EDITOR ~/dotfiles/.vimrc'
alias sed='gsed'
alias cp='cp -r '
alias bat='bat --color=always --paging=always'
alias bake='make'
alias funcs='vi ~/dotfiles/funcs.sh'
alias h='cd $HOME'
alias js='nvm_init'

#  misc
alias cheat='$EDITOR $HOME/personal/lists/cheat_sheet.md'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias quotes='$EDITOR $HOME/personal/lists/quotes.md'

#  grip
alias grip='source $HOME/personal/github-pass.sh; grip --user $guser --pass $gpass'

# programs
alias nbtree='exa --tree ~/.nb'
alias nbls='nb ls --paths --filenames --no-indicators'

alias g='rg -l --hidden --smart-case --line-buffered'
alias gl='rg --hidden --smart-case --line-buffered'
alias b='cd ..'
alias c='clear'
alias cls='clear && ls'
alias cll='clear && ll'
alias ctree='clear && tree'
alias ls='exa --long --icons --no-permissions --no-user --git --time-style long-iso --time=modified --group-directories-first -a'
alias tree='exa --tree --ignore-glob="*pycache*"'
alias ll='exa -G --icons --group-directories-first -a'
alias ipy='ipython'
alias pip='pip3'
alias pipr='pip install -r requirements.txt'
alias jl='jupyter lab > /dev/null 2>&1 &'
alias py='python'
alias pyt='pytest'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias df='df -h'
alias markserv='markserv --browser'

export GENERAL="/Users/adam/.pyenv/versions/3.10.6/envs/general/bin"

# be polite!
alias please='sudo'

# files
alias todo='$EDITOR $HOME/.nb/home/todo.md'
alias td='todo'
alias inbox='$EDITOR $HOME/.nb/home/inbox.md'
alias inb='inbox'
alias ideas='$EDITOR $HOME/dss/notes/content/ideas/README.md'

alias back='cd -'

# folders
alias cdb='cd $HOME/climate-news-db'
alias blog='cd $HOME/adgefficiency.github.io/'
alias epl='cd $HOME/energy-py-linear'
alias web='cd $HOME/climate-code/website'
alias content='cd $HOME/climate-code/notes/content'
alias website='cd $HOME/climate-code/website'
alias ep='cd $HOME/energy-py-experiments/energy-py'
alias epl='cd $HOME/energy-py-linear'
alias expt='cd $HOME/energy-py-experiments'
alias per='cd $HOME/personal'
alias prog='cd $HOME/programming-resources'
alias teach='cd $HOME/teaching-monolith'
alias syl='cd $HOME/handbook'

alias je='bundle exec jekyll serve > /dev/null 2>&1 &'
alias jed='ruby_init; bundle exec jekyll serve --drafts > /dev/null 2>&1 &'

# spelling
alias exut='exit'
alias eixt='exit'
alias exot='exit'
alias ext='exit'
alias eit='exit'
alias q='exit'
alias wi='vi'

# dotfiles
alias dots='cd $HOME/dotfiles'
alias aliases='$EDITOR $HOME/dotfiles/aliases.sh'
alias bashrc='$EDITOR $HOME/dotfiles/.bashrc'
alias yabairc='$EDITOR $HOME/dotfiles/yabai/yabairc'
alias vimrc='$EDITOR $HOME/dotfiles/.vimrc'
alias tmuxc='$EDITOR $HOME/dotfiles/.tmux.conf'
alias zshrc='$EDITOR $HOME/dotfiles/.zshrc'
alias zs='source ~/.zshrc'

#  git
alias gs='git status'
alias ga='git add -u && git commit -m '
alias gc='git commit -m '
alias gp='git push origin '
alias gls='clear && git status --short'
alias gall='git add * && git add -u && git commit -m "sync all the things" && git push origin master'
alias amend='git commit --amend'
alias cred='git config credential.helper store'
alias gd='git diff --staged'

alias nbg='git checkout -b'
alias gnb='git checkout -b'
alias cbg='git checkout '
alias gcb='git checkout '

alias db='git branch -D '
alias gmv='git mv '

alias glog='git log --pretty=fuller --abbrev-commit --stat'

#  tmux
alias ta='tmux attach'
alias tab='tmux attach -t base'
alias tl='tmux ls'
alias tls='tmux ls'
tn () {
    name=$($HOME/.pyenv/versions/general/bin/zxpy $HOME/dotfiles/scripts/random-name.py)
    tmux new -s $name
}
alias t='tn'

#  docker
alias dc='docker-compose'
docker-ssh () {
    docker exec -it $1 /bin/sh
}

docker-build () {
    NAME=$1
    DOCKERFILE=$2
    docker build -t $NAME . -f $DOCKERFILE
}

docker-run () {
    NAME=$1
    COMMAND=$2
    docker run -it $NAME $COMMAND
}

docker-ip () {
    NAME=$1
    docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $NAME
}

docker-build-run () {
    build-docker $1 $2
    run-docker $1
}

docker-ls () {
  docker network list
  docker volume list
}

docker-exec-last () {
  docker exec -it "$(docker ps | awk 'NR==2{print $1}')" /bin/bash
}
