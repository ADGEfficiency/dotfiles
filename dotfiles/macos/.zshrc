source $HOME/dotfiles/dotfiles/common/.zshrc
# eval "$(gh copilot alias -- zsh)"
head -n 20 $HOME/personal/para/resource/cheat_sheet.md | tail -n 14 | bat --language=markdown -p --color=always --paging=never --theme=Dracula

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.local/bin/env"
