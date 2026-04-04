# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Agent Instructions
- Read the `README.md`
- Read the agent instructions in `AGENTS.md`

## Style Guidelines
- **Python**: Use Ruff formatting, type hints, PEP 8 naming (snake_case)
- **Shell Scripts**: Use double quotes for variables, bash shebang for scripts
- **Error Handling**: Use proper error handling with exit codes in shell scripts
- **Neovim Config**: Organize by functionality in lua/plugins/ directory
- **Imports**: Group and sort imports (use isort for Python)
- **Comments**: Be descriptive but concise, explain why not what
- **Documentation**: For functions, include purpose and parameter descriptions
- **Testing**: Test shell functions using shunit2 framework
