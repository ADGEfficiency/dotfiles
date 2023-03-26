ubuntu-setup: pre gpu ~/z.sh ~/.vim/bundle/Vundle.vim ~/.pyenv/Makefile



pre: ./ubuntu/pre



	./ubuntu/pre
	touch pre

gpu: pre
	./ubuntu/gpu
	touch gpu

~/z.sh: pre ./ubuntu/rust
	./ubuntu/rust

~/.vim/bundle/Vundle.vim: pre
	./ubuntu/vim
	#  this is for neovim
	mkdir -p ~/.vimundo

~/.pyenv/Makefile: pre
	./ubuntu/pyenv

python-general:
	cd ./python-general/; sh setup.sh
