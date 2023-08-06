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

echo "setting up ~/.zprofile"
echo "source $HOME/dotfiles/.zprofile" >> "$HOME/.zprofile"

echo "setting up ~/.vimrc"
echo "source $HOME/dotfiles/.vimrc" >> "$HOME/.vimrc"

echo "setting up ~/.tmux.conf"
echo "source $HOME/dotfiles/.tmux.conf" >> "$HOME/.tmux.conf"

echo "setting up git"
cp "$HOME/dotfiles/.gitignore" "$HOME/.gitignore"
cp "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
