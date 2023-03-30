# dotfiles

Setup dotfiles & Git:

```bash
$ make dotfiles
```

Setup an Ubuntu machine how I like it (this will also run the dotfiles setup):

```bash
$ make ubuntu
```

## iPython

Always import Python libraries in iPython (`numpy`, `pandas` etc):

```shell
$ cp ~/dotfiles/ipython/start.py ~/.ipython/profile_default/startup/start.py 
$ mkdir -p ~/dotfiles/ipython/profile_default/
$ cp ~/dotfiles/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py
```
