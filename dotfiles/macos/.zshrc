source $HOME/dotfiles/dotfiles/common/.zshrc
# eval "$(gh copilot alias -- zsh)"
head -n 20 $HOME/personal/para/resource/cheat_sheet.md | tail -n 14 | bat --language=markdown -p --color=always --paging=never --theme=Dracula

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.local/bin/env"

eval "$(keychain --eval --quiet --agents ssh ~/.ssh/github-air ~/.ssh/macbook-pro)"

export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib

quote
echo ""
quote
echo ""
# . "$HOME/.local/bin/env"
eval "$(/opt/homebrew/bin/brew shellenv)"
