default:
	@echo "hello ^^"

.PHONY: setup-common setup-macos setup-ubuntu setup-wsl

setup-common:
	bash ./config/tmux/setup.sh
	bash ./config/fzf/setup.sh
	bash ./scripts/setup-zsh.sh
	bash ./scripts/setup-pi.sh
	bash ./scripts/setup-extras.sh

setup-macos: export OS=macos
setup-macos: brew-pkgs dotfiles setup-common setup-python
	bash ./os/macos/setup.sh

setup-ubuntu: export OS=ubuntu
setup-ubuntu: brew-pkgs dotfiles setup-common
	bash ./os/ubuntu/setup.sh

setup-wsl: export OS=wsl
setup-wsl: dotfiles setup-common
	bash ./os/wsl/setup.sh

.PHONY: setup-stow dotfiles setup-uv setup-python

STOW_ARGS=-vv
setup-stow:
	bash ./stow/setup.sh

dotfiles: setup-stow
	stow "$(STOW_ARGS)" -d dotfiles -t "$(HOME)" "$(OS)"
	stow "$(STOW_ARGS)" dotfiles

	# ai agent config
	mkdir -p "$(HOME)/.agents"
	ln -sfn ~/dotfiles/agents/skills "$(HOME)/.agents/skills"
	mkdir -p "$(HOME)/.claude"
	ln -sfn ~/dotfiles/agents/skills "$(HOME)/.claude/skills"
	ln -sf ~/dotfiles/config/pi/AGENTS.md "$(HOME)/.claude/CLAUDE.md"
	# PI coding agent is not configured via symlink - uses PI_CODING_AGENT_DIR

	mkdir -p ~/.config
	# explicit opt-in to the symlink from config into ~/.config
	ln -sfn ~/dotfiles/config/fish ~/.config/fish
	ln -sfn ~/dotfiles/config/nvim ~/.config/nvim
	ln -sfn ~/dotfiles/config/lazygit ~/.config/lazygit
	ln -sfn ~/dotfiles/config/direnv ~/.config/direnv
	ln -sfn ~/dotfiles/config/mise ~/.config/mise
	ln -sfn ~/dotfiles/config/fzf ~/.config/fzf
	ln -sfn ~/dotfiles/config/lsd ~/.config/lsd
	ln -sfn ~/dotfiles/config/kitty ~/.config/kitty

setup-python:
	bash ./scripts/setup-uv.sh

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
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
	brew update; brew upgrade

brew-pkgs: setup-brew
	brew bundle --file ~/dotfiles/config/brew/Brewfile --no-upgrade
