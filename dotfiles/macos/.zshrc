source $HOME/dotfiles/dotfiles/common/.zshrc
eval "$(gh copilot alias -- zsh)"
head -n 15 /Users/adam/personal/para/resource/cheat_sheet.md | tail -n 9 | bat --language=markdown -p --color=always --paging=never --theme=Dracula
