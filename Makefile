default:
	echo "hello ^^"

# test

test:
	sh ./tests/*.sh

# setting up machines

## linux + macos

dotfiles:
	sh ./scripts/setup-dotfiles.sh

python-general:
	sh ./python-general/setup.sh

## linux

ubuntu: dotfiles
	sh ./ubuntu/main.sh

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

macos-brew-install: js-install
	brew update && brew upgrade
	brew install git llvm make
	brew install htop tmux tree wget fzf ripgrep lazydocker gh direnv pyenv pyenv-virtualenv
	brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep lazygit

	brew install yabai
	chmod +x ~/dotfiles/yabai/yabairc

	brew install --HEAD koekeishiya/formulae/skhd
	chmod +x ~/dotfiles/skhd/skhdrc

	brew tap homebrew/cask-fonts
	brew install --cask font-hack-nerd-font

	rustup update stable
	cargo install starship

js-install:
	cd js && npm install -g .

nvim-brew-install: js-install
	brew install nvim efm-langserver shellcheck hadolint checkmake markdownlint-cli
	cargo install cbfmt stylua starship

nix-setup:
	curl -L https://nixos.org/nix/install | sh
	. $(HOME)/.nix-profile/etc/profile.d/nix.sh
	export PATH=$$PATH:$(HOME)/.nix-profile/bin
	nix-channel --add https://nixos.org/channels/nixpkgs-unstable
	nix-channel --update

nix-install: nix-setup
	nix-env -i -f ./nix/default.nix
