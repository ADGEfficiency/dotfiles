#!/usr/bin/env bash

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
brew update && brew upgrade
brew install pyenv pyenv-virtualenv yabai
chmod +x ~/dotfiles/yabai/yabairc

brew install --HEAD koekeishiya/formulae/skhd
chmod +x ~/dotfiles/skhd/skhdrc

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
