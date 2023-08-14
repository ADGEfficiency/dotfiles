#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles/dotfiles

setup_dotfile() {
    local fi=$1
    echo "Setting up ~/$fi"
    echo "source $DOTFILES/$fi" >> "$HOME/$fi"
    cat ~/$fi
}

setup_dotfile .bashrc
setup_dotfile .zshrc
setup_dotfile .zprofile
setup_dotfile .vimrc
setup_dotfile .tmux.conf

echo "setting up git"
cp "$HOME/dotfiles/.gitignore" "$HOME/.gitignore"
cp "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
