# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Codebase Structure
- Read the `README.md`
- **Stow**: Use GNU Stow to create symlinks to dotfiles in `./dotfiles` for different `OS`.
- **OS**: The `OS` environment variable is used in the Makefile.

## Style Guidelines
- **Python**: Use Ruff formatting, type hints, PEP 8 naming (snake_case)
- **Shell Scripts**: Use double quotes for variables, bash shebang for scripts
- **Error Handling**: Use proper error handling with exit codes in shell scripts
- **Neovim Config**: Organize by functionality in lua/plugins/ directory
- **Imports**: Group and sort imports (use isort for Python)
- **Comments**: Be descriptive but concise, explain why not what
- **Documentation**: For functions, include purpose and parameter descriptions
- **Testing**: Test shell functions using shunit2 framework

Always respect existing conventions in each file and this repository when making changes.

Read the README.md.
