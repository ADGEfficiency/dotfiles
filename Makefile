dotfiles:
	bash setup-dotfiles.sh

ubuntu: dotfiles
	bash ./ubuntu/main.sh

python-general:
	bash ./python-general/setup.sh
