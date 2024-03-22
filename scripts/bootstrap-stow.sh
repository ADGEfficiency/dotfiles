#!/usr/bin/env bash

echo "Bootstrap GNU Stow if needed..."

if [ "$OS" = "macos" ]; then
  if command -v stow &> /dev/null; then
    echo "Stow already installed."
  else
    if ! command -v brew &> /dev/null; then
      echo "Homebrew not found. Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    echo "Installing Stow using Homebrew..."
    brew install stow
  fi

elif [ "$OS" = "ubuntu" ]; then
  if command -v stow &> /dev/null; then
    echo "Stow already installed."
  else
    echo "Installing Stow using apt-get..."
    sudo apt-get update
    sudo apt-get install -y stow
  fi

else
  echo "Unsupported operating system $OS for bootstrapping GNU Stow"
  exit 1
fi
