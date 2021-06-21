## mac

brew install exa
npm install gtop -g
brew install zoxide


## jupyter lab

pip install jupyterlab==1.2.0
jupyter labextension install jupyterlab_vim

## ipython

```sh
cp ~/dotfiles/ipython/start.py ~/.ipython/profile_default/startup/start.py 
mkdir -p ~/dotfiles/ipython/profile_default/
cp ~/dotfiles/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py
```

## linux
sudo apt-get update
sudo apt install python3-pip
exa, zoxide

## vim

on linux to upgrade to 8.0
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update; sudo apt install vim

also need node for coc
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim

https://github.com/palantir/python-language-server

```sh
pip install python-language-server
pip install jedi
```

## tunnels

6006 = tensorboard, 8000 = jupyter lab

```sh
ssh -N -L localhost:6006:localhost:6006 $USER@$HOST
```


