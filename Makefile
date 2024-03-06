#  can be either macos or ubuntu
OS = macos

.PHONY: default dotfiles test setup-macos setup-ubuntu

default:
	echo "hello ^^"

dotfiles:
	bash ./dotfiles/setup.sh

test: setup-nix
	bash ./nix/load-$(OS).sh && bash ./tests/*.sh

setup-macos: brew-pkgs setup-nix
	bash ./macos/setup.sh

setup-ubuntu: setup-nix
	bash ./ubuntu/setup.sh

.PHONY: setup-pyenv python js

setup-pyenv:
	bash ./python/setup-pyenv.sh

python: setup-pyenv
	bash ./python/setup-general-venv.sh general 3.10.6
	bash ./python/setup-general-venv-pkgs.sh

js:
	npm install -g @tailwindcss/language-server markserv
	npm install -g remark-cli remark-lint remark-preset-lint-consistent remark-preset-lint-markdown-style-guide remark-preset-lint-recommended remark-stringify
	npm install -g jsonlint jshint
	npm install -g sql-language-server

.PHONY: clean-nvim setup-vim

clean-nvim:
	# cleans packer stuff
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin
	rm -rf ~/dotfiles/nvim/plugin
	# cleans lazy stuff
	rm ~/.local/share/nvim/lazy ~/.local/state/nvim/lazy ./nvim/lazy-lock.json

setup-vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	"vim" +PluginInstall +qall

.PHONY: setup-nix nix-pkgs

setup-nix:
	curl -L https://nixos.org/nix/install | sh
	. ./nix/load-$(OS).sh && nix-channel --add https://nixos.org/channels/nixpkgs-unstable unstable
	. ./nix/load-$(OS).sh && nix-channel --update

devShell = --arg devShell true
install_cmd = nix-env -i -f ./nix/default.nix $(devShell) --keep-going
nix-pkgs: setup-nix
	. ./nix/load-$(OS).sh && $(install_cmd)

.PHONY: setup-brew brew-pkgs

setup-brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	brew update; brew upgrade

brew-pkgs: setup-brew
	brew install hadolint vale actionlint fzf mactex pandoc
