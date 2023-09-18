# Dotfiles

Setup and configuration for a terminal based developer workflow.

## Bash, Zsh & Git

Setup `.bashrc`, `.zshrc` & `.gitconfig` in `$HOME`:

```shell-session
$ make dotfiles
```

This appends to your `rc` files in `$HOME` -- beware running this multiple times, as you will end up sourcing the `rc` files multiple times.

This is destructive to your Git config - your `$HOME/.{gitconfig,gitignore}` will be overwritten.

## Linux

Setup an Linux machine:

```shell-session
$ make setup-linux OS=linux
```

## MacOS

Setup an MacOS machine:

```shell-session
$ make setup-macos OS=macoS
```

## Global Python Virtual Env

Install pyenv and pyenv-virtualenv:

```bash
$ bash ./python/setup-pyenv.sh
```

Setup a global Python installation in a pyenv virtual environment - requires `pyenv`:

```shell-session
$ make python
```

## Neovim

Neovim setup is in [nvim](https://github.com/ADGEfficiency/dotfiles/tree/master/nvim) -- it's a Lua based setup.

To use my Neovim setup, you would put this folder into `$XDG_CONFIG_HOME`.

### Formatting and Linting,

I used to use NullLS, then tried efm - I now use [conform](https://github.com/stevearc/conform.nvim) to manage formatters and `nvim-lint` to manage linting.

## Mason

I use Mason to install LSPs. With Mason I use [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers).

## Lists of Linting & Formatting Tools

### [efm-langserver](https://github.com/mattn/efm-langserver)

See the `config.yml` example for available tools.

### [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim/blob/main/supported-linters-and-formatters.md)

I don't use this package, but the list of tools and configs is useful.

### [Null LS](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)

I don't use this package -- I used to use Null LS -- their list of tools is still useful.

### Conform

https://github.com/stevearc/conform.nvim#formatters

### Nvim Lint

https://github.com/mfussenegger/nvim-lint#available-linters
