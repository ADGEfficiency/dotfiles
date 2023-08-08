#  can be either macos or ubuntu
OS = macos

default:
	echo "hello ^^"

test: nix-setup
	bash ./nix/load-$(OS).sh && bash ./tests/*.sh

# setting up machines
brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

setup-macos: brew
	sh ./macos/setup.sh

setup-ubuntu:
	sh ./ubuntu/setup.sh

#  TODO make this sh ./dotfiles/setup.sh
dotfiles:
	sh ./scripts/setup-dotfiles.sh

python:
	sh ./python/setup.sh

js:
	cd js && npm install -g .

# neovim

inspect-nvim:
	tree ~/.local/share/nvim/site/pack/packer/ -L 2

clean-nvim:
	brew uninstall nvim
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin

#  not sure this fits into makefile - TODO move to README.md
# softwareupdate --install-rosetta
# arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# alias brew='arch -x86_64 brew'

.PHONY: nix nix-setup
nix:
	# already have setup of the nix-daemon in ~/dotfiles/.zshrc
	# . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
	# when installing nix on ubuntu, the deamon is not ther
	curl -L https://nixos.org/nix/install | sh
	. ./nix/load-$(OS).sh && nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
	. ./nix/load-$(OS).sh && nix-channel --update

devShell = --arg devShell true
install_cmd = nix-env -i -f ./nix/default.nix $(devShell)
nix-setup: nix
	. ./nix/load-$(OS).sh && $(install_cmd)
