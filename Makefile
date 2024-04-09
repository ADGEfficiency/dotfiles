#  can be either macos or ubuntu
OS = macos

.PHONY: default bootstrap-stow dotfiles test setup-macos setup-ubuntu

default:
	echo "hello ^^"

bootstrap-stow:
	bash ./scripts/bootstrap-stow.sh

STOW_ARGS=-vv
dotfiles: bootstrap-stow
	stow $(STOW_ARGS) -d dotfiles -t $(HOME) $(OS)
	stow $(STOW_ARGS) dotfiles
	stow $(STOW_ARGS) yabai

test: setup-nix
	bash ./nix/load-$(OS).sh && bash ./tests/*.sh

setup-macos: dotfiles brew-pkgs setup-nix
	bash ./tmux/setup.sh
	bash ./macos/setup.sh

setup-ubuntu: dotfiles setup-nix
	bash ./tmux/setup.sh
	bash ./ubuntu/setup.sh

.PHONY: setup-pyenv python js

setup-pyenv:
	bash ./python/setup-pyenv.sh

python: setup-pyenv
	bash ./python/setup-general-venv.sh general 3.12.2
	bash ./python/setup-general-venv-pkgs.sh

js:
	npm install -g @tailwindcss/language-server markserv
	npm install -g remark-cli remark-lint remark-preset-lint-consistent remark-preset-lint-markdown-style-guide remark-preset-lint-recommended remark-stringify
	npm install -g jsonlint jshint
	npm install -g sql-language-server

.PHONY: clean-nvim setup-vim

clean-nvim:
	# clean packer stuff
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin
	rm -rf ~/dotfiles/nvim/plugin
	# clean lazy stuff
	rm -rf ~/.local/share/nvim/lazy ~/.local/state/nvim/lazy ./nvim/lazy-lock.json

setup-vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	"vim" +PluginInstall +qall

.PHONY: setup-nix nix-pkgs

setup-nix:
	curl -L https://nixos.org/nix/install | sh
	. ./nix/load-$(OS).sh && nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
	. ./nix/load-$(OS).sh && nix-channel --update

nix-pkgs: setup-nix
	. ./nix/load-$(OS).sh && cd nix && nix profile install

.PHONY: setup-brew brew-pkgs

setup-brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	brew update; brew upgrade

brew-pkgs: setup-brew
	brew install hadolint vale actionlint mactex pandoc
