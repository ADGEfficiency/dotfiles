echo "source $HOME/dotfiles/.aliases" >> "$HOME/.bashrc"
echo "source $HOME/dotfiles/.bashrc" >> "$HOME/.bashrc"
echo "source $HOME/dotfiles/.funcs" >> "$HOME/.bashrc"

echo "source $HOME/dotfiles/.aliases" >> "$HOME/.zshrc"
echo "source $HOME/dotfiles/.zshrc" >> "$HOME/.zshrc"
echo "source $HOME/dotfiles/.funcs" >> "$HOME/.zshrc"

echo "source $HOME/dotfiles/.vimrc" >> "$HOME/.vimrc"
echo "source $HOME/dotfiles/.tmux.conf" >> "$HOME/.tmux.conf"

cp "$HOME/dotfiles/.gitignore" "$HOME/.gitignore"

git config --global core.excludesfile $HOME/dotfiles/.gitignore
git config --global user.email "adam.green@adgefficiency.com"
git config --global user.name "Adam Green"
