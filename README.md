# Dotfiles

Setup and configuration for a terminal first developer workflow.

## Bash, Zsh & Git

Setup `.bashrc` & `.zshrc` in `$HOME` and configure Git:

```bash
$ make dotfiles
```

This appends to your `rc` files -- beware running this multiple times.

## Ubuntu

Setup an Ubuntu machine -- tested on 18.04:

```bash
$ make ubuntu
```

## Global Python Virtual Env

Setup a global Python installation in a pyenv virtual environment:

```shell-session
$ make python-general
```

## Neovim

My Neovim setup is in [nvim](https://github.com/ADGEfficiency/dotfiles/tree/master/nvim).

```shell-session
$ make macos-brew-install
```

### Notes on `efm-langserver`

[efm-langserver](https://github.com/mattn/efm-langserver)

`efm-langserver` is setup as a language server using `lspconfig` in [lsp.lua](https://github.com/ADGEfficiency/dotfiles/blob/master/nvim/lua/adam/lsp.lua).

Tools (formatters, linters) are added to the efm language server -- see the `config.yml` example for both available tools and how to configure.

Tools can have the [following properties](https://github.com/mattn/efm-langserver/blob/master/schema.md#autogenerated_heading_4).

- `formatCommand`,
- `formatStdin`,
- `hoverCommand`,
- `hoverStdin`,
- `hoverType`,
- `lintCommand`,
- `lintFormats`,
- `lintStdin`,
- `completionCommand`,
- `completionStdin`,

### Mason

I use Mason to install LSPs. With mason I use [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers).

Don't use mason for `efm` -- install `efm-langserver` separately:

```shell-session
$ go install github.com/mattn/efm-langserver@latest
#  or
$ brew install efm-langserver
```

## Available Linting / Formatting Tools

### [efm-langserver](https://github.com/mattn/efm-langserver)

See the `config.yml` example for available tools.

### [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim/blob/main/supported-linters-and-formatters.md)

I don't use this package, but the list of tools and configs is useful.

### [Null LS](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)

I don't use this package -- I used to use Null LS -- their list of tools is still useful.
