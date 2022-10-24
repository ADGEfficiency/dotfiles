echo "source $HOME/dotfiles/aliases.sh" >> "$HOME/.bashrc"
echo "source $HOME/dotfiles/.bashrc" >> "$HOME/.bashrc"
echo "source $HOME/dotfiles/funcs.sh" >> "$HOME/.bashrc"

echo "source $HOME/dotfiles/aliases.sh" >> "$HOME/.zshrc"
echo "source $HOME/dotfiles/.zshrc" >> "$HOME/.zshrc"
echo "source $HOME/dotfiles/funcs.sh" >> "$HOME/.zshrc"

echo "source $HOME/dotfiles/.vimrc" >> "$HOME/.vimrc"
echo "source $HOME/dotfiles/.tmux.conf" >> "$HOME/.tmux.conf"

cp "$HOME/dotfiles/.gitignore" "$HOME/.gitignore"
cp "$HOME/dotfiles/.p10k.zsh" "$HOME"

git config --global core.excludesfile $HOME/dotfiles/.gitignore
git config --global user.email "adam.green@adgefficiency.com"
git config --global user.name "Adam Green"
