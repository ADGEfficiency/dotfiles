#!/usr/bin/env bash

echo "setting up ~/.bashrc"
{
  echo "source $HOME/dotfiles/.bashrc"
  echo "source $HOME/dotfiles/scripts/funcs.sh"
  echo "source $HOME/dotfiles/scripts/aliases.sh"
} >> "$HOME/.bashrc"
cat ~/.bashrc

echo "setting up ~/.zshrc"
{
  echo "source $HOME/dotfiles/.zshrc"
  echo "source $HOME/dotfiles/scripts/funcs.sh"
  echo "source $HOME/dotfiles/scripts/aliases.sh"
  echo "source $HOME/dotfiles/.zpreztorc"
} >> "$HOME/.zshrc"
cat ~/.zshrc

echo "source $HOME/dotfiles/.vimrc" >> "$HOME/.vimrc"
echo "source $HOME/dotfiles/.tmux.conf" >> "$HOME/.tmux.conf"

cp "$HOME/dotfiles/.gitignore" "$HOME/.gitignore"

git config --global core.excludesfile "$HOME/dotfiles/.gitignore"
git config --global user.email "adam.green@adgefficiency.com"
git config --global user.name "Adam Green"
