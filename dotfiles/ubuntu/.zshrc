eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
source $HOME/dotfiles/dotfiles/common/.zshrc
ssh-add ~/.ssh/github ~/.ssh/ado
export TODO_DIR=~/docs/project
export PERSONAL_PATH=~/docs
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/ado 2>/dev/null
    ssh-add ~/.ssh/github 2>/dev/null
fi
alias expl='explorer.exe .'
