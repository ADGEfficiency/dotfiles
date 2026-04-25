default:
	@echo "hello ^^"

.PHONY: setup-common setup-macos setup-ubuntu setup-wsl

setup-common:
	bash ./tmux/setup.sh
	bash ./zsh/setup.sh
	bash ./fzf/setup.sh
	bash ./scripts/setup-pi.sh
	bash ./scripts/setup-extras.sh

setup-macos: export OS=macos
setup-macos: brew-pkgs dotfiles setup-common setup-python
	bash ./macos/setup.sh

setup-ubuntu: export OS=ubuntu
setup-ubuntu: brew-pkgs dotfiles setup-common
	bash ./ubuntu/setup.sh

setup-wsl: export OS=wsl
setup-wsl: dotfiles setup-common

.PHONY: setup-stow dotfiles setup-uv setup-python

STOW_ARGS=-vv
setup-stow:
	bash ./stow/setup.sh

dotfiles: setup-stow
	stow "$(STOW_ARGS)" -d dotfiles -t "$(HOME)" "$(OS)"
	stow "$(STOW_ARGS)" dotfiles
	stow "$(STOW_ARGS)" yabai
	stow "$(STOW_ARGS)" skhd
	ln -sf ~/dotfiles/fish ~/.config/fish
	mkdir -p "$(HOME)/.agents"
	ln -sfn ~/dotfiles/agents/skills "$(HOME)/.agents/skills"
	mkdir -p "$(HOME)/.claude"
	ln -sfn ~/dotfiles/agents/skills "$(HOME)/.claude/skills"
	ln -sf ~/dotfiles/config/pi/AGENTS.md "$(HOME)/.claude/CLAUDE.md"
	# ln -sf ~/dotfiles/config/pi/AGENTS.md "$(HOME)/.pi/agent/AGENTS.md"

setup-uv:
	bash ./python/setup-uv.sh

setup-python: setup-uv
	cd ~ && ~/.local/bin/uv venv --python 3.11.9
	~/.local/bin/uv pip install -r ./python/pyproject.toml

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
