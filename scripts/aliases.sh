#!/usr/bin/env bash

export todo=$HOME/personal/todo.md
export vimrc=$HOME/dotfiles/.vimrc
export CHEAT=$HOME/personal/lists/cheat_sheet.md
export PER=$HOME/personal/
export GDR=$HOME/GoogleDrive
export GENERAL="/Users/adam/.pyenv/versions/3.10.6/envs/general/bin"

# be polite!
alias please='sudo'

# folders
alias mkdir='mkdir -p'
alias rm='rm -rf'

# search
alias g='rg -l --hidden --smart-case --line-buffered'
alias gl='rg --hidden --smart-case --line-buffered'

# moving around
alias h='cd $HOME'
alias b='cd ..'
alias back='cd -'

# clearing & listing
alias c='clear'
alias cll='clear && ll'
alias cls='clear && ls'
alias ctree='clear && tree'
alias ll='exa -G --icons --group-directories-first -a'
alias ls='exa --long --icons --no-permissions --no-user --git --time-style long-iso --time=modified --group-directories-first -a'
alias tree='exa --tree --ignore-glob="*pycache*"'

# program customization
alias bat='bat --color=always --paging=always'
alias cp='cp -r '
alias df='df -h'
alias sed='gsed'

# servers
alias je='bundle exec jekyll serve > /dev/null 2>&1 &'
alias jed='ruby_init; bundle exec jekyll serve --drafts > /dev/null 2>&1 &'
alias jl='jupyter lab > /dev/null 2>&1 &'
alias markserv='markserv --browser'

# vim
alias v='$EDITOR Makefile README.md'
alias vi='$EDITOR'
alias vimrc='$EDITOR ~/dotfiles/.vimrc'

# python
alias py='python'
alias pip='pip3'
alias pipr='pip install -r requirements.txt'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias ipy='ipython --TerminalInteractiveShell.editing_mode=vi'
alias quotes='$EDITOR $HOME/personal/lists/quotes.md'

# nb
alias nbtree='exa --tree ~/.nb'
alias nbls='nb ls --paths --filenames --no-indicators'

# files
alias cheat='$EDITOR $HOME/personal/lists/cheat_sheet.md'
alias ideas='$EDITOR $HOME/dss/notes/content/ideas/README.md'
alias inb='inbox'
alias inbox='$EDITOR $HOME/.nb/home/inbox.md'
alias td='todo'
alias todo='$EDITOR $HOME/.nb/home/todo.md'

# folders
alias blog='cd $HOME/adgefficiency.github.io/'
alias cdb='cd $HOME/climate-news-db'
alias content='cd $HOME/climate-code/notes/content'
alias ep='cd $HOME/energy-py-experiments/energy-py'
alias epl='cd $HOME/energy-py-linear'
alias epl='cd $HOME/energy-py-linear'
alias expt='cd $HOME/energy-py-experiments'
alias per='cd $HOME/personal'
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
alias bashrc='$EDITOR $HOME/dotfiles/.bashrc'
alias yabairc='$EDITOR $HOME/dotfiles/yabai/yabairc'
alias vimrc='$EDITOR $HOME/dotfiles/.vimrc'
alias tmuxc='$EDITOR $HOME/dotfiles/.tmux.conf'
alias zshrc='$EDITOR $HOME/dotfiles/.zshrc'
alias zs='source ~/.zshrc'

#  git
alias amend='git commit --amend'
alias cbg='git checkout '
alias cred='git config credential.helper store'
alias db='git branch -D '
alias ga='git add -u && git commit -m '
alias gall='git add * && git add -u && git commit -m "sync all the things" && git push origin master'
alias gc='git commit -m '
alias gcb='git checkout '
alias gd='git diff --staged'
alias glog='git log --pretty=fuller --abbrev-commit --stat'
alias gls='clear && git status --short'
alias gmv='git mv '
alias gnb='git checkout -b'
alias gp='git push origin '
alias gs='git status'
alias nbg='git checkout -b'

#  tmux
alias ta='tmux attach'
alias tab='tmux attach -t base'
alias tl='tmux ls'
alias tls='tmux ls'

#  docker
alias dc='docker-compose'