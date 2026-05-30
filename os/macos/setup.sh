#!/usr/bin/env bash
brew update && brew upgrade
brew install yabai
brew install --cask amethyst
brew install --cask dockdoor
chmod +x ~/dotfiles/dotfiles/.yabairc
brew install --HEAD koekeishiya/formulae/skhd
chmod +x ~/dotfiles/dotfiles/.skhdrc
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
