#  can be either macos or ubuntu
OS = macos

default:
	echo "hello ^^"

test: nix-setup
	bash ./nix/load-$(OS).sh && bash ./tests/*.sh

brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

setup-macos: brew nix-setup
	bash ./macos/setup.sh

setup-linux:
	bash ./linux/setup.sh

.PHONY: dotfiles
dotfiles:
	bash ./dotfiles/setup.sh

.PHONY: python js
python:
	zsh ./python/setup-general-venv.sh general 3.10.6
	zsh ./python/setup-general-venv-pkgs.sh

js:
	cd js && npm install -g .

# neovim
inspect-nvim:
	tree ~/.local/share/nvim/site/pack/packer/ -L 2

clean-nvim:
	brew uninstall nvim
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin

#  not sure this fits into makefile ...
#  apple silicon stuff
# softwareupdate --install-rosetta
# arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# alias brew='arch -x86_64 brew'

# nix

.PHONY: nix nix-setup
nix:
	curl -L https://nixos.org/nix/install | sh
	. ./nix/load-$(OS).sh && nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
	. ./nix/load-$(OS).sh && nix-channel --update

devShell = --arg devShell true
install_cmd = nix-env -i -f ./nix/default.nix $(devShell) --keep-going
nix-setup: nix
	. ./nix/load-$(OS).sh && $(install_cmd)
