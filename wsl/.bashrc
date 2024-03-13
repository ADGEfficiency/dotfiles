echo wsl/.bashrc
source "$HOME"/dotfiles/dotfiles/.bashrc
alias docs='cd ~/onedrive/docs'
alias od='cd ~/onedrive'
export TODO_DIR="/home/adam/onedrive/docs"
keychain --quiet ~/.ssh/github_ed25519
keychain --quiet ~/.ssh/azure-devops_id_rsa
