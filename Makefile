default:
	@echo "hello ^^"

.PHONY: setup-macos setup-ubuntu setup-wsl setup-common setup-stow

setup-common:
	bash ./tmux/setup.sh
	bash ./zsh/setup.sh
	bash ./fzf/setup.sh

setup-macos: export OS=macos
setup-macos: brew-pkgs dotfiles setup-common
	bash ./macos/setup.sh

setup-ubuntu: export OS=ubuntu
setup-ubuntu: dotfiles setup-common
	bash ./ubuntu/setup.sh

setup-wsl: export OS=wsl
setup-wsl: dotfiles setup-common

setup-stow:
	bash ./stow/setup.sh

.PHONY: dotfiles test

STOW_ARGS=-vv
dotfiles: setup-stow
	stow "$(STOW_ARGS)" -d dotfiles -t "$(HOME)"$(OS)
	stow "$(STOW_ARGS)" dotfiles
	stow "$(STOW_ARGS)" yabai
	ln -sf ~/dotfiles/fish ~/.config/fish\

.PHONY: setup-uv python js

setup-uv:
	bash ./python/setup-uv.sh

python: setup-uv
	cd ~ && ~/.local/bin/uv venv --python 3.11.9
	~/.local/bin/uv pip install -r ./python/pyproject.toml

js:
	npm install -g remark-cli remark-lint remark-preset-lint-consistent remark-preset-lint-markdown-style-guide remark-preset-lint-recommended remark-stringify jsonlint jshint sql-language-server @tailwindcss/language-server markserv

.PHONY: clean-nvim setup-vim

clean-nvim:
	# clean packer stuff
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin
	rm -rf ~/dotfiles/nvim/plugin
	# clean lazy stuff
	rm -rf ~/.local/share/nvim/lazy ~/.local/state/nvim/lazy

setup-vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	"vim" +PluginInstall +qall

.PHONY: setup-brew brew-pkgs

setup-brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	brew update; brew upgrade

brew-pkgs: setup-brew
	brew bundle --file ~/dotfiles/brew/Brewfile --no-upgrade
