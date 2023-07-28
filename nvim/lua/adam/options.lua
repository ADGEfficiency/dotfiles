-- :help options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.incsearch = true                        -- incrementally search
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.undodir = vim.fn.expand("~/.vimundo/")
vim.opt.updatetime = 80                         -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.numberwidth = 4                         -- set number column width
vim.opt.signcolumn =
"yes"                                           -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 4                           -- always have more than n lines at the top & bottom
vim.opt.sidescrolloff = 0
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.backspace = "indent,eol,start"
vim.opt.wildignore = "+=*.egg-info/**"
vim.opt.wildmenu = true
vim.opt.wrap = true

-- global status bar (bottom one)
vim.opt.laststatus = 3

vim.g["python3_host_prog"] = "~/.pyenv/versions/general/bin/python"

vim.g["undotree_SetFocusWhenToggle"] = 1
vim.g["undotree_DiffAutoOpen"] = 0
vim.g["undotree_ShortIndicators"] = 1

-- format on save
vim.cmd([[autocmd BufWritePost *.py silent! execute ':Format']])

-- highlighting of spelling mistakes
vim.cmd([[hi! link SpellBad ErrorMsg]])

-- show tabs and spaces
vim.opt.list = true
vim.opt.listchars = "tab:>-"

vim.opt.makeprg = "gmake"
vim.opt.spell.spellang = "en_nz"

vim.g["vim_markdown_no_default_key_mappings"] = 1

vim.g["copilot_node_command"] = "/Users/adam/dotfiles/nvm/versions/node/v16.17.0/bin/node"
