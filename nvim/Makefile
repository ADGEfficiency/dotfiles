.PHONY: all clean

inspect:
	tree ~/.local/share/nvim/site/pack/packer/ -L 2

clean:
	brew uninstall nvim
	rm -rf ~/.local/share/nvim/site
	rm -rf ./plugin

setup:
	brew update
	brew upgrade
	brew install nvim
	brew install efm-langserver shellcheck hadolint checkmake markdownlint-cli prettier
	cargo install cbfmt stylua
