# dotfiles

Setup and configuration for my terminal based developer workflow across three `OS` (MacOS, Ubuntu & WSL):

- **Zsh** shell
- **Tmux** for shell session management
- **Homebrew** for managing shell tools
- **mise** for programming language runtimes (except Python)
- **uv** for Python runtime and virtual environments
- **Neovim** for text editing
- **Makefile** for setup & maintenance
- **Stow** for dotfiles symlinking

This repo should be cloned into `$HOME`. Symlinks into the right places are managed in two ways:

- **Stow** handles files that belong in `$HOME` (e.g. `.zshrc`, `.gitconfig`). OS-specific files live in `./dotfiles/$OS/` (e.g. `./dotfiles/macos/.zshrc`) and common files in `./dotfiles/`.
- **Explicit symlinks** (`ln -sf`) wire up individual `./config/*` directories into `~/.config/` (e.g. `./config/nvim` → `~/.config/nvim`). Only directories that are explicitly opted-in to in the `Makefile` are linked.

## Use

You can setup your machine using commands in `Makefile`.  Commonly setting up a machine involves doing things like:

- Installing packages with Homebrew
- Setting up symlinks with Stow
- Setting up tmux & Zsh
- Installing language runtimes with mise

### Ubuntu

Setup an Ubuntu machine:

```shell-session
$ make setup-ubuntu
```

This will also setup dependencies with Homebrew.

### macOS

Setup a macOS machine:

```shell-session
$ make setup-macos
```

This will:
- Install Homebrew if not already installed
- Install all dependencies from `./brew/Brewfile`
- Setup dotfiles with Stow
- Configure tmux, Zsh, and fzf

### Python

Install `uv` and setup a global Python installation in a virtual environment:

```bash
$ make setup-python
```

## Components

Use GNU Stow to symlink dotfiles for Bash, Zsh, Tmux and Git:

```shell-session
$ make dotfiles
```

Note: The `OS` variable is automatically set by the `setup-macos` and `setup-ubuntu` targets. For manual dotfiles setup, you can export the OS variable first:

```shell-session
$ export OS=macos && make dotfiles
```

Valid values for `OS` are `macos`, `wsl` or `windows`.

A script `./stow/setup.sh` will attempt to bootstrap Stow if it's not already available. Stow bootstrapping is not setup for Windows because Windows is awful.

You can run the setup without bootstrapping Stow with:

```shell-session
$ make dotfiles OS=macos -o setup-stow
```

### Homebrew

Install packages with Homebrew from the Brewfile:

```shell-session
$ make brew-pkgs
```

This will:
- Install Homebrew if not already installed
- Install all packages defined in `./brew/Brewfile`

### mise

mise is used for managing programming language runtime versions (Python, Node.js, Go, etc.). It's automatically installed via the Brewfile and activated in Zsh via an `eval`.

### Neovim

Neovim config is in `./config/nvim`. To use the Neovim setup alone, put the `nvim` folder into `$XDG_CONFIG_HOME` (commonly `~/.config`).

I use Lazy for package management in Neovim - it will install packages when you first open the editor.

### `s`

The `s` command opens a fuzzy file finder (fzf) to search and open files in `$EDITOR`. Run `s` in any directory, or pass a path like `s ~/projects`. Supports multi-select with Tab.

### Aliases

Lot's of aliases - see `./scripts/aliases.sh`.  Some small interactive shell helper functions in `./scripts/funcs.sh`.

## AI Agent Configuration

`PI_CODING_AGENT_DIR` in dotfiles/common/env.sh points pi's config to `~/dotfiles/config/pi/`.

`CLAUDE.md` at the repo root serves the same purpose for Claude Code.

<<<<<<< HEAD
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

## AI Configuration

Two AGENTS.md:

- `./AGENTS.md` for this repo
- `./pi/config/pi/agent/AGENTS.md` for Pi & Claude Code

PI_CODING_AGENT_DIR in dotfiles/common/env.sh points pi's config to ~/dotfiles/config/pi/, which contains agent/AGENTS.md (agent instructions), settings.json, themes, and sessions.

CLAUDE.md at the repo root serves the same purpose for Claude Code, but is symlinked to `AGENTS.md`.

Skills are defined once in agents/skills/ and symlinked by make dotfiles to both ~/.agents/skills (pi) and ~/.claude/skills (Claude Code).
||||||| 5f1ddca
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

## Agent Configuration

PI_CODING_AGENT_DIR in dotfiles/common/env.sh points pi's config to ~/dotfiles/config/pi/, which contains agent/AGENTS.md (agent instructions), settings.json, themes, and sessions.

CLAUDE.md at the repo root serves the same purpose for Claude Code.

Skills are defined once in `.agents/skills/` and symlinked by `make dotfiles` to both `~/.agents/skills` (for Pi) and `~/.claude/skills` (for Claude Code).
