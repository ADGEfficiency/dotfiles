# dotfiles

Setup dotfiles & git:

```bash
$ bash setup-dotfiles.sh
```

Setup an Ubuntu machine how I like it (this will also run the dotfiles setup):

```bash
$ cd ubuntu; bash main.sh
```

## Jupyter Lab

The Vim bindings for Jupyter Lab - you need to use Jupyter Lab v1 for the plugin to work:

```shell
$ ./jupyterlab-vim.sh
```

## iPython

Always import Python libraries in iPython (`numpy`, `pandas` etc):

```shell
$ cp ~/dotfiles/ipython/start.py ~/.ipython/profile_default/startup/start.py 
$ mkdir -p ~/dotfiles/ipython/profile_default/
$ cp ~/dotfiles/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py
```

## Autocomplete in coc.vim

```sh
pip install python-language-server
pip install jedi
```

## Setup a General / Default Python Virtual Env

```sh
$ make python-general
```
