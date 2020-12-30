echo "source $HOME/dotfiles/.bashrc" >> "$HOME/.bashrc"
echo "source $HOME/dotfiles/.aliases" >> "$HOME/.bashrc"

echo "source $HOME/dotfiles/.zshrc" >> "$HOME/.zshrc"
echo "source $HOME/dotfiles/.aliases" >> "$HOME/.zshrc"

echo "source $HOME/dotfiles/.vimrc" >> "$HOME/.vimrc"
echo "source $HOME/dotfiles/.tmux.conf" >> "$HOME/.tmux.conf"

git config --global core.excludesfile $HOME/dotfiles/.gitignore
