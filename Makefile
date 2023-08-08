default:
	echo "hello ^^"

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

nix-setup-macos:
	# already have setup of the nix-daemon in ~/dotfiles/.zshrc
	# . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
	# when installing nix on ubuntu, the deamon is not ther
	curl -L https://nixos.org/nix/install | sh
	nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
	nix-channel --update

nix-setup-ubuntu:
	curl -L https://nixos.org/nix/install | sh
	. /home/runner/.nix-profile/etc/profile.d/nix.sh && nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
	. /home/runner/.nix-profile/etc/profile.d/nix.sh && nix-channel --update

install_cmd = nix-env -i -f ./nix/default.nix
nix-install-macos: nix-setup-macos
	$(install_cmd)

nix-install-ubuntu: nix-setup-ubuntu
	. /home/runner/.nix-profile/etc/profile.d/nix.sh && $(install_cmd)

# test

test:
	bash ./tests/*.sh

test-ubuntu:
	. /home/runner/.nix-profile/etc/profile.d/nix.sh && bash ./tests/*.sh
