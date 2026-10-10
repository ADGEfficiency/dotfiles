source "$HOME/dotfiles/dotfiles/common/.zshrc"
source "$HOME/dotfiles/dotfiles/wsl/common.sh"
eval $(keychain --quiet --eval github ado)
# eval $(keychain --eval --agents ssh -Q --quiet $HOME/.ssh/azure-devops_id_rsa)
[ -d ~/docs ] || ln -s "/mnt/c/Users/ag43/OneDrive - Meridian Energy Limited/Documents/docs" ~/docs
