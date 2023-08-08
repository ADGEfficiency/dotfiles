default:
	echo "hello ^^"

# setting up machines

## linux + macos

setup:
	sh ./$(OS)/setup.sh

#  TODO make this sh ./dotfiles/setup.sh
dotfiles:
	sh ./scripts/setup-dotfiles.sh

python:
	sh ./python/setup.sh

js:
	cd js && npm install -g .

#  TODO make this sh ./linux/setup.sh
ubuntu: dotfiles
	sh ./ubuntu/main.sh

# TODO macos: dotfiles sh ./macos/setup.sh

# neovim

inspect-nvim:
	tree ~/.local/share/nvim/site/pack/packer/ -L 2

clean-nvim:
	brew uninstall nvim
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin

# master installs
macos-brew: macos-brew-install nvim-brew-install

#  not sure this fits into makefile - TODO move to README.md
# softwareupdate --install-rosetta
# arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# alias brew='arch -x86_64 brew'

#  macos or ubuntu
OS = macos

macos-brew-install: nix-install js
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
	brew update && brew upgrade
	brew install pyenv pyenv-virtualenv yabai
	chmod +x ~/dotfiles/yabai/yabairc

	brew install --HEAD koekeishiya/formulae/skhd
	chmod +x ~/dotfiles/skhd/skhdrc

	brew tap homebrew/cask-fonts
	brew install --cask font-hack-nerd-font

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

test: nix-setup
	bash ./nix/load-$(OS).sh && bash ./tests/*.sh
