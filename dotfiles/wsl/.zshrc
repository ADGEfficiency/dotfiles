source "$HOME/dotfiles/dotfiles/common/.zshrc"
source "$HOME/dotfiles/dotfiles/wsl/common.sh"

eval $(keychain --eval --agents ssh -Q --quiet $HOME/.ssh/azure-devops_id_rsa)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.local/bin/env"

source $HOME/.local/bin/env
