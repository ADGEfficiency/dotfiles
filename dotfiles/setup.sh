#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles/dotfiles

setup_dotfile() {
  local fi=$1
  echo "Setting up ~/$fi"
  echo "source $DOTFILES/$fi" >> "$HOME/$fi"
  cat "$HOME/$fi"
}

setup_dotfile .bashrc
setup_dotfile .bash_profile
setup_dotfile .zshrc
setup_dotfile .zshenv
setup_dotfile .zprofile
setup_dotfile .vimrc
setup_dotfile .tmux.conf

echo "source $HOME/dotfiles/yabai/yabairc" >> "$HOME/.yabairc"

echo "setting up git"
cp "$HOME/dotfiles/git/.gitignore" "$HOME/.gitignore"
cp "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
cp "$HOME/dotfiles/dotfiles/.npmrc" "$HOME/.npmrc"
