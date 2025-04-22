source $HOME/dotfiles/dotfiles/common/.zshrc
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
eval "$(gh copilot alias -- zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "$HOME/.local/bin/env"
eval "$(keychain --eval --quiet --agents ssh ~/.ssh/github-air ~/.ssh/macbook-pro)"
eval "$(/opt/homebrew/bin/brew shellenv)"
quote
echo ""
quote
