---
name: propose-tool-use-improvements
description: Find and propose exactly one new thing the user does not already know - a language feature, a CLI flag, a tool option, or a workflow pattern. Grounded in their actual configs and shell history, logged so it never repeats.
---

# Propose One Improvement

Find **one** thing the user does not already know and would use: a language feature,
a command line flag, a config option, a keybinding, or a workflow pattern.

One. Not a list, not a ranked set, not an audit. The value is a single specific
thing worth learning today, verified as new to them.

## When to Use

- "teach me something", "what am I missing", "one improvement"
- The user wants to level up without installing anything
- Periodic use - the Already Proposed list at the bottom of this file stops repeats

## Step 1: Rule out what they already know

This is most of the work. A proposal they already use is a failure.

Check **Already Proposed** at the bottom of this file first - everything listed there
is spent, whatever its merits.

Then establish current state:

- `README.md` and `Makefile` at `~/dotfiles` - the symlink architecture
- `dotfiles/common/.zshrc` - the bulk of the shell config, sourced by every OS
- `dotfiles/$OS/.zshrc` - thin per-OS overlay (`macos`, `ubuntu`, `wsl`)
- `config/brew/Brewfile` - what is installed
- `config/nvim/`, `config/git/`, `config/fzf/`, `config/starship/`, `config/lsd/`,
  `config/mise/`, `config/lazygit/`, `config/kitty/`, `dotfiles/.tmux.conf`,
  `dotfiles/.gitconfig`, `dotfiles/.skhdrc`

Never read or edit the `$HOME` copies - they are symlinks into the repo.

Mine the shell history for what they actually do. `HISTFILE` is `~/.zsh_history`,
capped at 10M entries. `LC_ALL=C` is required - the file holds non-UTF8 bytes and
`sort` aborts with `Illegal byte sequence` without it.

```bash
export LC_ALL=C
# top commands
awk -F';' '{print $2}' ~/.zsh_history | awk '{print $1}' | sort | uniq -c | sort -rn | head -40
# top full invocations - shows which flags they already reach for
awk -F';' '{print $2}' ~/.zsh_history | sort | uniq -c | sort -rn | head -40
# does a specific flag or feature ever appear?
grep -c -- '--flag-here' ~/.zsh_history
```

Resolve names in the live shell rather than trusting a grep - many aliases come from
prezto, not from the repo:

```bash
type ls cat grep find
```

Also check `zsh/.zprezto/modules/*/init.zsh` and `scripts/`.

## Step 2: Hunt for candidates

Draw from the stack actually in use:

- **Python 3.14** via `uv` - the standard library and syntax move fast; `uv` itself
  gains subcommands often
- **Go 1.24**, **Rust**, **Node 22**, **Ruby 3.3**, **Lua**, **Zig** - pinned in
  `config/mise/`
- **zsh 5.9** - parameter expansion flags, globbing qualifiers, ZLE widgets
- **git** - plumbing and newer porcelain most people never touch
- **Installed tools' flags** - `ripgrep`, `fd`, `fzf`, `bat`, `jq`, `duckdb`, `lsd`,
  `difftastic`, `delta`, `gh`, `just`, `entr`, `gum`, `ov`, `btop`, `tmux`, `neovim`
- **Workflow patterns** - git worktrees, `direnv` layouts, `entr` watch loops,
  `just` recipes, tmux session scripting

Use `WebSearch` and `WebFetch` on release notes and official docs. Release notes are
the richest source - a feature added after their config was written is new by
construction.

Verify the thing exists in the version they have. Check with `brew info <tool>`,
`<tool> --version`, or `<tool> --help | grep`. Do not propose a flag from a newer
release than they run.

## Step 3: Pick one

Rank candidates on:

- **Genuinely new** - absent from configs, history, and Already Proposed.
  Non-negotiable.
- **Reaches their real work** - it should touch something in the top 40 commands, or
  a language they write daily
- **Small to adopt** - learnable in one sitting; a flag or feature, not a migration
- **Durable** - worth keeping, not a party trick

Prefer the sharp and specific over the broadly useful. "Use git worktrees" is weaker
than one exact flag that removes a step they currently do by hand.

## Step 4: Present it

Short. Aim for under 150 words before the example block.

This is the shape to follow. Every bracketed slot must be filled with something you
measured or read - never carry a placeholder through, and never invent a count:

```markdown
## `<exact name of the flag, feature or pattern>`

<One line on what it does.>

**Why you** - <the evidence: a `path:line` showing it absent, a history count for the
command it improves, and the zero-hit grep proving the feature itself never appears.>

**Try it**
```bash
<runnable command, as they would actually type it>
```

**Where it earns its place** - <the specific moment in their workflow it replaces.>

**Catch** - <one honest limitation, or "none".>
```

Rules for the write-up:

- Lead with the thing itself, named exactly
- One line on what it does
- **Why you** must cite the evidence - a `path:line`, a history count, or the
  absence of a grep hit. Without evidence it is a guess, and a guess is worthless
  here because the whole claim is "this is new to you"
- A runnable example, not pseudocode
- One honest catch or limitation, or say there is none
- No tables. Spaced hyphens ` - `, not em dashes. No closing summary

Offer to wire it in, but do not edit anything unasked. If it belongs in config, say
which file and which `$OS` dirs, and whether the `Makefile` needs a line (new
`config/*` directories are opt-in via explicit `ln -sfn`, so they do).

## Step 5: Log it

Edit this file. Append one line to **Already Proposed** at the bottom, in the same
turn as presenting - not later, or it is lost.

Log rejected proposals too. Rejected is spent - re-pitching something the user already
declined is worse than repeating a hit.

## Do Not Propose

- **Anything in Already Proposed** - check the list first, every time
- **Anything already in their config or history** - grep before claiming novelty.
  This is the one failure that makes the skill useless
- **A new tool to install** - that is `propose-tools`. This skill finds more in what
  they have
- **Migrations off committed choices** - zsh, tmux, Neovim, Homebrew, mise, uv, stow
  and the Makefile are settled. No zellij, nix, chezmoi, oh-my-zsh, asdf, pyenv,
  poetry. Improve inside those choices
- **Basics** - they have run a terminal for years. `cd -`, `git stash`, `ctrl-r` and
  friends are not findings
- **More than one thing** - no "and while you're here". If two candidates tie, pick
  one and log only that one
- **Git workflow changes** - Adam runs all git operations himself

## Related

- `propose-tools` - new tools to install
- `create-plan` - if the accepted thing needs real work, plan it under
  `docs/ai/YYYY-MM/plan-$NAME.md`

## Already Proposed

Everything shown so far, accepted or rejected. Append one line per proposal, newest
at the bottom. Keep it to a single line each - date, the thing, three or four words.

<!-- append below this line -->
- 2026-10-11 - `zmv` - zsh bulk rename, pitched

