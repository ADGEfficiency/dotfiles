---
name: propose-tools
description: Propose new CLI tools and applications based on the user's existing tool configuration. Analyzes Brewfiles, package manifests, or tool lists to suggest complementary additions with explanations of what value each adds to the workflow.
---

# Propose Tools

Analyze the user's existing tool configuration and propose new tools that would complement their workflow. Explain what each tool does, why it fits their setup, and what specific value it adds.

## When to Use

- User shares a Brewfile, package.json, or list of installed tools and asks for recommendations
- User wants to discover tools in a specific category (e.g., "what are good Rust CLI tools?")
- User is setting up a new machine and wants suggestions
- User mentions a workflow pain point that could be solved with a tool

## Step 1: Analyze Existing Tools

First, understand what the user already has:

| What to Look For | Why It Matters |
|-----------------|----------------|
| **Language preferences** | Rust tools? Go tools? Node-based? Suggests ecosystem preferences |
| **Terminal-centric vs GUI** | Heavy CLI suggests TUI tools; mixed suggests both |
| **Shell environment** | zsh/bash/fish with prompt customizers (starship, p10k) |
| **Editor setup** | Neovim, Emacs, VS Code—suggests integration opportunities |
| **Task runners** | just, task, make—suggests build/automation tools |
| **Version managers** | mise, asdf, nvm—suggests polyglot development |
| **Multiplexer/WM** | tmux, zellij, yabai, skhd—suggests power-user patterns |

## Step 2: Research Complementary Tools

Use **code_search** and **web_search** to find:

1. **Direct complements** - Tools that enhance what they already use (e.g., `delta` for git users)
2. **Category gaps** - Missing categories they might benefit from (e.g., no file manager → suggest `yazi`)
3. **Modern alternatives** - Faster Rust/Go rewrites of tools they use (e.g., `ripgrep` → `grep`)
4. **Ecosystem standards** - Tools commonly paired with their stack

Example searches:
```
"modern CLI tools 2024 2025 Rust alternatives"
"best terminal file manager yazi lf ranger comparison"
"zellij vs tmux features benefits"
"complement to [tool they have] workflow"
```

## Step 3: Structure Recommendations

Present tools in a table or list with:

| Column | Purpose |
|--------|---------|
| **Tool** | Name and one-line description |
| **Why You'd Like It** | Connects to their existing workflow |
| **Replaces/Complements** | What it improves or works alongside |

For high-interest tools, add:
- **Quick install** command (e.g., `brew install foo`)
- **What you'd gain** - Specific workflow improvements
- **What you might miss** - Honest trade-offs vs alternatives

## Step 4: Categorize Suggestions

Group recommendations by:

- **Immediate wins** - Tools that slot into existing workflows
- **Worth experimenting** - Tools that replace something (tmux → zellij)
- **Honorable mentions** - Related tools for future exploration

## Response Format

```markdown
Based on your [file], here are [N] tools that would complement your workflow:

## [N] Recommended Tools

| Tool | Description | Why It Fits |
|------|-------------|-------------|
| yazi | Terminal file manager (Rust) | You use lf/fzf—yazi adds image previews + faster |
| atuin | Shell history with sync | You have starship—atuin upgrades Ctrl+R experience |

### Deep Dive: [Most Relevant Tool]

**What it gets you:**
- Feature A (how it improves on current tool)
- Feature B (new capability)

**Quick try:**
\`\`\`bash
brew install [tool]
[quick start command]
\`\`\`

**Trade-offs:**
| Current | This Tool |
|---------|-----------|
| X | Y |

### Honorable Mentions
- tool-a - brief reason
- tool-b - brief reason
```

## Exclusions

Avoid recommending these categories of tools:

| Category | Examples | Why Exclude |
|----------|----------|-------------|
| **Already installed** | ripgrep, fd, fzf, zellij, atuin | Check their manifest—don't suggest what they have |
| **Duplicate functionality** | eza vs lsd vs exa, zellij vs tmux vs screen | One tool per category is enough |
| **Deprecated/unmaintained** | exa (use eza), bat-extras | Prefer actively maintained forks |
| **Niche without context** | kubectl plugins, language-specific LSPs | Unless they work in that domain |
| **GUI alternatives to their CLI tools** | VS Code when they use Neovim | Respect their terminal-centric choices |
| **Highly personal/dotfiles tools** | Shell prompts beyond starship/p10k, custom PS1 | These are deeply personal choices |

### Common Tools to Check For

Popular modern CLI tools that often appear in dotfiles—verify these aren't already present before suggesting:
- **Shell/terminal**: zellij, tmux, zoxide, atuin, mcfly, thefuck
- **File/text**: ripgrep, fd, fzf, eza, bat, delta, sd, yazi
- **Dev tools**: mise, asdf, just, hyperfine, tokei, grex

### Handling User Exclusions

If the user mentions tools to exclude:
- Note them explicitly at the start of recommendations
- Respect category-level exclusions (e.g., "no more Rust tools")
- Don't suggest alternatives to excluded tools (e.g., if they exclude zellij, don't push tmux "instead")

## Guidelines

- **Lead with the "why"** - Always connect suggestions back to their existing setup
- **Be honest about trade-offs** - Replacement tools have switching costs; acknowledge them
- **Respect their choices** - If they use tmux, don't push zellij hard—offer it as an experiment
- **Prioritize active projects** - Prefer tools with recent releases and healthy communities
- **Include install command** - Usually `brew install`, but adapt to their package manager
- **Limit to 10 main suggestions** - Too many is overwhelming; use "honorable mentions" for extras

## Example User Flow

1. User: "look at my brewfile - propose 10 other tools i might like"
2. Read Brewfile → identify Rust CLI tools, tmux, Neovim, task runners
3. Research: `code_search("zellij vs tmux features 2024")`, `web_search("modern Rust CLI tools")`
4. Suggest: yazi (complements fzf), zellij (tmux alt), atuin (enhances shell), etc.
5. User asks follow-up: "what would zellij get me?"
6. Deep dive with specific features, trade-offs, quick-start
