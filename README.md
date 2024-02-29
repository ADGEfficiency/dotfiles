# dotfiles

Setup and configuration for a terminal based developer workflow.

## Bash, Zsh & Git

Setup `.bashrc`, `.zshrc` & `.gitconfig` in `$HOME`:

```shell-session
$ make dotfiles
```

This runs a script `./dotfiles/setup.sh` which either:

- appends to your `rc` files in `$HOME`, 
- copies over files in `$HOME` for `.gitignore`, `.gitconfig` and `.npmrc`.

Beware running this multiple times, as you will end up sourcing the `rc` files multiple times.

Beware overwriting your `.gitignore`, `.gitconfig` and `.npmrc` files in `$HOME`.

## Linux

Setup an Linux machine:

```shell-session
$ make setup-linux OS=linux
```

This will also setup dependencies with Nix from `./nix/default.nix`.

## MacOS

Setup an MacOS machine:

```shell-session
$ make setup-macos OS=macoS
```

This will also setup dependencies with Nix from `./nix/default.nix`.

## Global Python Virtual Env

Install pyenv and pyenv-virtualenv:

```bash
$ make python
```

This will setup a global Python installation in a pyenv virtual environment.

## Neovim

Neovim setup is in [./nvim](https://github.com/ADGEfficiency/dotfiles/tree/master/nvim) -- it's a Lua based setup.

To use my Neovim setup, you would put this folder into `$XDG_CONFIG_HOME`.

### Formatting and Linting

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

[Conform formatters](https://github.com/stevearc/conform.nvim#formatters).

### Nvim Lint

[nvim-lint linters](https://github.com/mfussenegger/nvim-lint#available-linters).

## Getting Kitty to Play Nice on MacOS

Had weird issue with the first execution of Kitty not loading the config correctly - fixed with:

```
# ~/Library/LaunchAgents/setenv.XDG_CONFIG_HOME.plist

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>setenv.XDG_CONFIG_HOME</string>
  <key>ProgramArguments</key>
  <array>
    <string>sh</string>
    <string>-c</string>
    <string>launchctl setenv XDG_CONFIG_HOME $HOME/dotfiles</string>
  </array>
  <key>RunAtLoad</key>
  <true/>
</dict>
</plist>

$ launchctl load ~/Library/LaunchAgents/setenv.XDG_CONFIG_HOME.plist
```
