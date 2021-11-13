sudo apt -y update
sudo apt -y upgrade
sudo apt -y install build-essential
sudo apt -y install git tree gnome-tweaks curl tree tmux

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

./vim
./rust
./pyenv
