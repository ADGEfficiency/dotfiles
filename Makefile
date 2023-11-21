#  can be either macos or ubuntu
OS = macos

default:
	echo "hello ^^"

test: setup-nix
	bash ./nix/load-$(OS).sh && bash ./tests/*.sh

setup-brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	brew update; brew upgrade

brew-pkgs: setup-brew
	brew install hadolint vale actionlint fzf mactex pandoc

setup-macos: brew-pkgs nix-setup
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
	npm install -g @tailwindcss/language-server markserv
	npm install -g remark-cli remark-lint remark-preset-lint-consistent remark-preset-lint-markdown-style-guide remark-preset-lint-recommended remark-stringify
	npm install -g jsonlint jshint
	npm install -g sql-language-server

inspect-nvim:
	tree ~/.local/share/nvim/site/pack/packer/ -L 2

clean-nvim:
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin

#  not sure this fits into makefile ...
#  apple silicon stuff
# softwareupdate --install-rosetta
# arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# alias brew='arch -x86_64 brew'

setup-vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	"vim" +PluginInstall +qall

# nix

.PHONY: setup-nix nix-pkgs
setup-nix:
	curl -L https://nixos.org/nix/install | sh
	. ./nix/load-$(OS).sh && nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
	. ./nix/load-$(OS).sh && nix-channel --update

devShell = --arg devShell true
install_cmd = nix-env -i -f ./nix/default.nix $(devShell) --keep-going
nix-pkgs: setup-nix
	. ./nix/load-$(OS).sh && $(install_cmd)
