-- Options

-- Set Leader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Disable backup files
vim.opt.backup = false

-- Disable swap file creation
vim.opt.swapfile = false

-- Use system clipboard for copy-paste
vim.cmd([[
  set clipboard+=unnamedplus
]])

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

-- Increase command line height for displaying messages
vim.opt.cmdheight = 1

-- Mostly used for cmp (completion)
vim.opt.completeopt = "menuone,noselect,preview"

-- File Encoding and Conceal Options
-- Ensure that `` is visible in markdown files
vim.opt.conceallevel = 0

-- Set the encoding written to a file
vim.opt.fileencoding = "utf-8"

-- Highlight all matches on previous search pattern
vim.opt.hlsearch = true

-- Incrementally search
vim.opt.incsearch = true

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Show tabs and spaces using Vim's list feature
vim.opt.list = true
vim.opt.listchars = "tab:>-"

-- Enable spell checking and set language
vim.opt.spell = true
vim.opt.spelllang = "en_nz"

-- Automatically open quickfix list after running :make
vim.cmd("autocmd QuickFixCmdPost [^l]* copen")

-- Allow the mouse to be used in Neovim
vim.opt.mouse = "a"

-- Set pop-up menu height
vim.opt.pumheight = 10

-- Disable showing things like -- INSERT --
vim.opt.showmode = false

-- Always show tabs in the tabline
vim.opt.showtabline = 2

-- Enable smart case in searches
vim.opt.smartcase = true

-- Incremental substitution while doing `:%s`
vim.opt.inccommand = "split"

-- Make indenting smarter
vim.opt.smartindent = true

-- Force all horizontal splits to go below the current window
vim.opt.splitbelow = true

-- Force all vertical splits to go to the right of the current window
vim.opt.splitright = true

-- Set term GUI colors (most terminals support this)
vim.opt.termguicolors = true

-- Enable persistent undo
vim.opt.undofile = true

-- Set the directory for persistent undo files
vim.opt.undodir = vim.fn.expand("~/.vimundo/")

-- Faster completion (default is 4000ms)
vim.opt.updatetime = 80

-- Prevent editing files simultaneously by another program
vim.opt.writebackup = false

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Number of spaces inserted for each indentation level
vim.opt.shiftwidth = 2

-- Insert 2 spaces for a tab
vim.opt.tabstop = 2

-- Highlight the current line
vim.opt.cursorline = true

-- Line numbers
vim.opt.number = true

-- Relative line numbers
vim.opt.relativenumber = false

-- Set number column width
vim.opt.numberwidth = 4

-- Always show the sign column, prevents text shifting
vim.opt.signcolumn = "yes"

-- Disable line wrapping
vim.opt.wrap = false

-- global status bar (bottom one)
vim.opt.laststatus = 3

-- Always have more than 4 lines at the top & bottom
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 0

-- Enable line wrapping
vim.opt.wrap = true

-- GUI Font Option (for graphical Neovim applications)
vim.opt.guifont = "monospace:h17"

-- Define backspace behavior
vim.opt.backspace = "indent,eol,start"

-- Specify patterns to ignore during wildcard expansion
vim.opt.wildignore = "+=*.egg-info/**"

-- Enable wildmenu for command-line completion
vim.opt.wildmenu = true
