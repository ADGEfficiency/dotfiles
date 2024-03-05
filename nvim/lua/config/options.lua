-- Options

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- File Handling Options
-- Disable backup files
vim.opt.backup = false

-- Clipboard and Display Options
-- Use system clipboard for copy-paste
vim.opt.clipboard = "unnamedplus"
-- Increase command line height for displaying messages
vim.opt.cmdheight = 1
-- Mostly used for cmp (completion)
vim.opt.completeopt = { "menuone", "noselect" }

-- File Encoding and Conceal Options
-- Ensure that `` is visible in markdown files
vim.opt.conceallevel = 0
-- Set the encoding written to a file
vim.opt.fileencoding = "utf-8"

-- Search and Highlighting Options
-- Highlight all matches on previous search pattern
vim.opt.hlsearch = true
-- Incrementally search
vim.opt.incsearch = true
-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Text Editing Options
-- Show tabs and spaces using Vim's list feature
vim.opt.list = true
vim.opt.listchars = "tab:>-"
-- Set the spelling language for spell checking
vim.opt.spell.spellang = "en_nz"
-- Automatically open quickfix list after running :make
vim.cmd("autocmd QuickFixCmdPost [^l]* copen")

-- Mouse and Pop-Up Menu Options
-- Allow the mouse to be used in Neovim
vim.opt.mouse = "a"
-- Set pop-up menu height
vim.opt.pumheight = 0

-- Interface and Display Options
-- Disable showing things like -- INSERT --
vim.opt.showmode = false
-- Always show tabs in the tabline
vim.opt.showtabline = 2
-- Enable smart case in searches
vim.opt.smartcase = true
-- Make indenting smarter
vim.opt.smartindent = true
-- Force all horizontal splits to go below the current window
vim.opt.splitbelow = true
-- Force all vertical splits to go to the right of the current window
vim.opt.splitright = true

-- Swap File and GUI Options
-- Disable swap file creation
vim.opt.swapfile = false
-- Set term GUI colors (most terminals support this)
vim.opt.termguicolors = true

-- Undo Options
-- Enable persistent undo
vim.opt.undofile = true
-- Set the directory for persistent undo files
vim.opt.undodir = vim.fn.expand("~/.vimundo/")
-- Faster completion (default is 4000ms)
vim.opt.updatetime = 80
-- Prevent editing files simultaneously by another program
vim.opt.writebackup = false

-- Indentation and Tab Options
-- Convert tabs to spaces
vim.opt.expandtab = true
-- Number of spaces inserted for each indentation level
vim.opt.shiftwidth = 2
-- Insert 2 spaces for a tab
vim.opt.tabstop = 2

-- Line and Column Display Options
-- Highlight the current line
vim.opt.cursorline = true
-- Show line numbers
vim.opt.number = true
-- Disable relative line numbers
vim.opt.relativenumber = false
-- Set number column width
vim.opt.numberwidth = 4
-- Always show the sign column, prevents text shifting
vim.opt.signcolumn = "yes"
-- Disable line wrapping
vim.opt.wrap = false
-- global status bar (bottom one)
vim.opt.laststatus = 3

-- Scrolling Options
-- Always have more than 4 lines at the top & bottom
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 0
-- Enable line wrapping
vim.opt.wrap = true

-- GUI Font Option (for graphical Neovim applications)
vim.opt.guifont = "monospace:h17"

-- Backspace and Wildmenu Options
-- Define backspace behavior
vim.opt.backspace = "indent,eol,start"
-- Specify patterns to ignore during wildcard expansion
vim.opt.wildignore = "+=*.egg-info/**"
-- Enable wildmenu for command-line completion
vim.opt.wildmenu = true

-- Set the path to the Python executable for Neovim's Python3 provider
-- vim.g["python3_host_prog"] = "~/.pyenv/versions/general/bin/python"

-- Filetype Specific
-- Detect .env-* files and set their filetype to sh
vim.cmd([[
augroup filetype_env
  autocmd!
  autocmd BufRead,BufNewFile .env-* setfiletype sh
  autocmd BufRead,BufNewFile .env.* setfiletype sh
augroup END
]])
-- Format Python files on save
vim.cmd([[autocmd BufWritePost *.py silent! execute ':Format']])

-- Markdown config
-- Clear previous syntax highlighting
-- Setup indenting
vim.api.nvim_exec(
	[[
 augroup markdown
     autocmd FileType markdown setlocal syntax=markdown
     autocmd FileType markdown setlocal spell spelllang=en_nz spellfile=~/dotfiles/nvim/spell/en.utf-8.add
     autocmd FileType markdown setlocal noautoindent
     autocmd FileType markdown setlocal nosmartindent
     autocmd FileType markdown setlocal expandtab
     autocmd FileType markdown let g:indentLine_enabled=0
     autocmd FileType markdown syntax keyword Todo TODO DONE
     set complete+=k
     autocmd FileType markdown setlocal conceallevel=0
 augroup end
 ]],
	false
)
-- Set the filetype for *.jinja files to jinja.html
vim.cmd("au BufRead,BufNewFile *.jinja setfiletype jinja.html")
-- Set the filetype for *.bats files to sh
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
	pattern = "*.bats",
	command = "set filetype=sh",
})

-- Vim Markdown Plugin Settings
-- Disable default key mappings for vim-markdown
vim.g["vim_markdown_no_default_key_mappings"] = 1

-- Co-pilot Plugin Settings
-- Set the path to the Node.js executable for Co-pilot
vim.g["copilot_node_command"] = "/Users/adam/dotfiles/nvm/versions/node/v16.17.0/bin/node"

-- Undotree Plugin Settings
-- Set undotree to focus when toggled
vim.g["undotree_SetFocusWhenToggle"] = 1
-- Disable automatic opening of the undotree diff window
vim.g["undotree_DiffAutoOpen"] = 0
-- Use short indicators in the undotree
vim.g["undotree_ShortIndicators"] = 1

-- close quickfix with q
vim.cmd([[
  autocmd FileType qf nnoremap <buffer> q :close<CR>
]])

vim.cmd([[
  command! -nargs=1 Tags execute 'grep -R "\- ' . <q-args> . '" . > /tmp/greptags.txt' | execute 'cfile /tmp/greptags.txt' | copen
]])

vim.cmd([[
  command Todo :sp ~/personal/para/todo.md
]])

vim.cmd([[
  command Get :sp ~/personal/para/area/to/get.md
]])

-- highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("yank-highlight", { clear = True }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
})
