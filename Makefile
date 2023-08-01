dotfiles:
	bash setup-dotfiles.sh

ubuntu: dotfiles
	bash ./ubuntu/main.sh

python-general:
	bash ./python-general/setup.sh

# neovim

inspect-nvim:
	tree ~/.local/share/nvim/site/pack/packer/ -L 2

clean-nvim:
	brew uninstall nvim
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin

setup-nvim:
	brew update && brew upgrade
	brew install nvim efm-langserver shellcheck hadolint checkmake markdownlint-cli prettier
	npm install -g remark-cli remark-stringify remark-lint remark-preset-lint-recommended remark-preset-lint-consistent remark-preset-lint-markdown-style-guide
	rustup update stable
	cargo install cbfmt stylua
