# dotfiles

Setup dotfiles & git:

```bash
$ ./setup-dotfiles.sh
```

Setup an Ubuntu machine, just how I like it:

```bash
$ ./ubuntu/main.sh
```


## Jupyter Lab

I like the Vim bindings for Jupyter - you need to use v1 for the plugin to work:

```shell
$ ./jupyterlab-vim.sh
```

## iPython

I import some Python libraries always in iPython (`numpy`, `pandas` etc):

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

