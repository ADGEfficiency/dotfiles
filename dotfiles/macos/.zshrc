source $HOME/dotfiles/dotfiles/common/.zshrc
export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. "$HOME/.local/bin/env"

eval "$(keychain --eval --quiet ~/.ssh/github-air ~/.ssh/macbook-pro)"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# Skip quote display for faster startup (can be called manually with 'quote' command)
# quote
# echo ""
# quote
