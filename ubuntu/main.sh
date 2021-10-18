sudo apt update
sudo apt upgrade
sudo apt -y install build-essential
sudo apt install git tree gnome-tweaks curl tree tmux fzf

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

./ubuntu/vim
./ubuntu/rust
./ubuntu/pyenv
