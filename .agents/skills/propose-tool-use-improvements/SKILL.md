---
name: propose-tool-use-improvements
description: Propose improvements to how the user currently uses their tools. Analyzes existing configurations, dotfiles, and workflows to suggest better patterns, unused features, integrations, or optimizations.
---

# Propose Tool Use Improvements

Analyze how the user currently uses their tools and propose improvements—better configurations, unused features, workflow optimizations, or integrations they're missing. Focus on getting more value from what they already have.

## When to Use

- User shares dotfiles and wants optimization suggestions
- User describes a workflow that seems inefficient or manual
- User has tools that might have features they don't know about
- User mentions friction points that could be solved with better configuration
- User wants to level up their existing setup without adding new tools

## Step 1: Analyze Current Configuration

Look for:

| What to Check | What to Find |
|--------------|--------------|
| **Config files** | `.tmux.conf`, `init.lua`, `.zshrc`, git configs—are they using defaults or customizing? |
| **Plugin ecosystems** | tpm for tmux, lazy.nvim for Neovim, zsh plugins—what's installed vs. what's available? |
| **Aliases/functions** | Are they repeating commands that could be aliased or scripted? |
| **Integration gaps** | Tools that could talk to each other but don't (e.g., fzf + git, zoxide + cd) |
| **Manual workflows** | Tasks done by hand that could be automated |

## Step 2: Identify Improvement Areas

Research what they're missing:

1. **Hidden features** - Tools often have powerful features users don't discover
2. **Better defaults** - Modern tools often need config to shine
3. **Integration opportunities** - Chaining tools together (e.g., `fzf` + `bat` + `ripgrep`)
4. **Performance tuning** - Startup time, lazy loading, parallelization
5. **Workflow patterns** - Better ways to accomplish common tasks

Use **code_search** and **fetch_content** to find:
- "Best practices for [tool] configuration 2024"
- "Hidden features of [tool]"
- "[Tool] + [other tool] integration"
- Official documentation for lesser-known features

## Step 3: Structure Recommendations

Group by impact and effort:

| Category | Description |
|----------|-------------|
| **Quick wins** | One-line config changes, aliases, or keybindings |
| **Medium investment** | Plugin installations, workflow changes, script creation |
| **Deep improvements** | Architecture changes, custom scripting, migration to better patterns |

For each suggestion include:
- **Current state** - What they're probably doing now
- **The improvement** - What to change and why it's better
- **Implementation** - Config snippet or command to make it happen

## Step 4: Provide Specific Configurations

Always give concrete, copy-pasteable improvements:

```markdown
### Enable fzf previews with bat

**Current:** Plain fzf without file previews
**Improvement:** Add syntax-highlighted previews

```bash
# Add to .zshrc/.bashrc
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
```
```

## Response Format

```markdown
## Improvements for Your [Tool/Workflow]

### Quick Wins

| Improvement | Why | Config |
|-------------|-----|--------|
| Enable tmux mouse mode | Scroll with trackpad, resize panes | `set -g mouse on` |
| Add zoxide to cd | Smarter directory jumping | `eval "$(zoxide init zsh)"` |

### Medium Investment

#### 1. [Feature Name]
**What you're missing:** [Description]
**The fix:** [Specific change]

```bash
# config snippet
```

**Result:** [What improves]

### Deep Improvements

#### [Architecture Change]
[Description of significant workflow improvement]
...

### Integration Opportunities

Your [Tool A] + [Tool B] could work together:
- Current: [Manual process]
- Better: [Integrated process]
- How: [Implementation]
```

## Guidelines

- **Assume good defaults first** - Don't suggest changes for change's sake; find real friction
- **Show the delta** - Make clear what changes vs. what stays the same
- **Provide configs** - Always include copy-pasteable snippets
- **Explain the "why"** - Help them understand what they're gaining
- **Respect complexity budgets** - Don't suggest 20 changes at once; prioritize
- **Check for existing setup** - Don't suggest what they already have
- **Version awareness** - Note if improvement requires tool updates

## Example User Flow

1. User: "here's my tmux.conf, how can I improve it?"
2. Read config → identify they're using mostly defaults, missing mouse mode, no vim keys, basic status bar
3. Research: `fetch_content` tmux documentation for newer features, best practices
4. Suggest: mouse mode, vim navigation, better status bar config, plugin recommendations (tpm + resurrect + continuum)
5. Provide specific config snippets for each
6. User asks: "what's resurrect get me?" → explain session persistence, show setup

## Common Improvement Patterns

### Tmux
- Mouse mode for scroll/resize
- Vim keys for navigation (`setw -g mode-keys vi`)
- Sensible prefix (Ctrl-a or Ctrl-space vs. Ctrl-b)
- tpm + essential plugins (resurrect, continuum, yank)
- Custom status bar with useful info

### Neovim
- Lazy loading for plugins
- LSP configuration improvements
- Telescope/fzf integration tuning
- Better keymaps for common actions
- Auto-formatting on save

### Shell (zsh/bash)
- zsh-autosuggestions + zsh-syntax-highlighting
- Better history settings (size, duplicates, sharing)
- fzf integration for history and files
- zoxide instead of/cd
- Starship prompt tuning

### Git
- Useful aliases (co, br, ci, st)
- delta for diff viewing
- Better merge/diff tools
- Hooks for linting/formatting
- Worktree usage for multi-branch work

### General CLI
- bat instead of cat (with config)
- ripgrep config file for defaults
- fd aliases for common finds
- just/task runner adoption for repeated commands
- direnv for project-specific env vars
