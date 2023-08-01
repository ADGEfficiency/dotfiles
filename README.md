# Dotfiles

Setup and configuration for a terminal first developer workflow.

My Neovim setup is in [nvim](https://github.com/ADGEfficiency/dotfiles/tree/master/nvim).

Setup `.bashrc` & `.zshrc` in `$HOME` and configure Git:

```bash
$ make dotfiles
```

This appends to your `rc` files -- beware running this multiple times.

Setup an Ubuntu machine:

```bash
$ make ubuntu
```

Setup a global Python installation in a pyenv virtual environment:

```shell-session
$ make python-general
```

## Neovim

```shell-session
$ make macos-brew-install
```

### Notes on `efm-langserver`

[efm-langserver](https://github.com/mattn/efm-langserver)

`efm-langserver` is setup as a language server using `lspconfig` in /Users/adam/dotfiles/nvim/lua/adam/lsp/init.lua

Tools are added -- see the `config.yml` example for both available tools and how to configure.

Tools can have the following properties (https://github.com/mattn/efm-langserver/blob/master/schema.md#autogenerated_heading_4)

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

## Mason

I use Mason to install LSPs, including some of

with mason i use `mason-lspconfig` 

https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers

Don't use mason for `efm` - install efm lang server separately

# Available Linting / Formatting Tools

## [efm-langserver](https://github.com/mattn/efm-langserver)

See the config.yml example

## [efmls-configs-nvim](https://github.com/creativenull/efmls-configs-nvim/blob/main/supported-linters-and-formatters.md)

I don't use this package, but I do use it for examples of `efm` tool configs

## [Null LS](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)

I used to use Null LS - their list of tools is useful - 
