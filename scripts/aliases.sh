#!/usr/bin/env bash

export PYENV_GENERAL="$HOME/.pyenv/versions/3.10.6/envs/general/bin"

# be polite - even to machines
alias please='sudo'

# folders
alias mkdir='mkdir -p'
alias rm='rm -rf'

# search
alias g='rg -l --hidden --smart-case --line-buffered'

# moving around
alias h='cd $HOME'
alias b='cd ..'
alias back='cd -'

# clearing screen & listing directories and files
alias c='clear'
alias cll='clear && ll'
alias cls='clear && ls'
alias ctree='clear && tree'

# lsd
alias ll='lsd --almost-all --group-directories-first'
alias ls='lsd --almost-all --long --icon always --git --date relative --group-directories-first -a'
alias tree='lsd --almost-all --tree'

# program customization
alias bat='bat --color=always --paging=always'
alias cp='cp -r '
alias df='df -h'

# servers
alias je='bundle exec jekyll serve > /dev/null 2>&1 &'
alias jed='bundle exec jekyll serve --drafts > /dev/null 2>&1 &'
alias jl='jupyter lab > /dev/null 2>&1 &'
alias markserv='markserv --browser'

# vim
alias vi='$EDITOR'

# python
alias py='python'
alias ipy='ipython'
alias pipr='pip install -r requirements.txt'
alias quotes='$EDITOR $PERSONAL_PATH/lists/quotes.md'

# files
alias cheat='$EDITOR $PERSONAL_PATH/resource/cheat_sheet.md'
alias ideas='$EDITOR $HOME/dss/notes/content/ideas/README.md'
alias inb='inbox'
alias inbox='$EDITOR $PERSONAL_PATH/area/inbox.md'

# folders
alias blog='cd $HOME/adgefficiency.github.io/'
alias cdb='cd $HOME/climate-news-db'
alias content='cd $HOME/climate-code/notes/content'
alias ep='cd $HOME/energy-py-experiments/energy-py'
alias epl='cd $HOME/energy-py-linear'
alias expt='cd $HOME/energy-py-experiments'
alias per='cd $PERSONAL_PATH'
alias docs='cd $PERSONAL_PATH'
alias prog='cd $HOME/programming-resources'
alias syl='cd $HOME/handbook'
alias teach='cd $HOME/teaching-monolith'
alias web='cd $HOME/climate-code/website'
alias website='cd $HOME/climate-code/website'

# spelling
alias bake='make'
alias eit='exit'
alias eixt='exit'
alias exot='exit'
alias ext='exit'
alias exut='exit'
alias q='exit'
alias wi='vi'

# dotfiles
alias dots='cd $HOME/dotfiles'
alias aliases='$EDITOR $HOME/dotfiles/scripts/aliases.sh'
alias funcs='$EDITOR $HOME/dotfiles/scripts/funcs.sh'
alias bashrc='$EDITOR $HOME/.bashrc'
alias zshrc='$EDITOR $HOME/.zshrc'
alias zs='source ~/.zshrc'
alias bs='source ~/.bashrc'
alias fs='source ~/dotfiles/fish/config.fish'
alias fishrc='$EDITOR $HOME/dotfiles/fish/config.fish'

# git
alias amend='git commit --amend'
alias cbg='git checkout '
alias cred='git config credential.helper store'
alias db='git branch -D '
alias ga='git add -u && git commit -m '
alias gau='git add -u'
alias gall='git add * && git add -u && git commit -m "sync all the things" && git push origin master'
alias gc='git commit -m '
alias gcm='git commit'
alias gcb='git checkout '
alias gd='git diff --staged'
alias gdiff='git diff --staged'
alias glog='git log --pretty=fuller --abbrev-commit --stat -n 5'
alias glogg='git log --pretty=fuller --abbrev-commit --stat --patch -n 5'
alias gls='clear && git status --short'
alias gmv='git mv '
alias gcb='git checkout '
alias gnb='git checkout -b'
alias gp='git push origin '
alias gs='git status'
alias nbg='git checkout -b'
alias gss='git stash'
alias gst='git stash'
alias gsa='git stash apply'
alias ups='git add . && git add -u && git commit -m "feat: ups" && git push'

# tmux
alias ta='tmux attach'
alias tab='tmux attach -t base'
alias tl='tmux ls'
alias ts='tmux ls'
alias tls='tmux ls'

# docker
alias dc='docker compose'

# start scripts
alias sp='start-personal'

# nix
alias nix-list='nix-env -q'
alias nix-clean='nix-env -e ".*" && nix-env --delete-generations old'

# misc
alias pyenv-list='pyenv versions --bare --skip-aliases'
alias pyenv-list-available='pyenv install -l'

alias pip-list='pip index versions'
alias poetry-clean='poetry cache clear pypi --all'

alias brew-list='brew list'

alias get='$EDITOR $PERSONAL_PATH/area/to/get.md'

# sets term colors when sshing
alias ssh='TERM=xterm-256color ssh'

alias lg='lazygit'

alias air='ssh adamgreen@air.local'
alias macbook='ssh adam@macbook.local'
