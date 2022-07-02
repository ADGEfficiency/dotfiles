local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local km = vim.api.nvim_set_keymap

-- leader
km("n", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

km("n", "<leader>a", ":ArgWrap<cr>", opts)
km("n", "<leader>o", ":Lex 30<cr>", opts)
km("n", "<leader>p", ":set paste!", opts)
km("n", "<leader>x", ":WinResizerStartResize", opts)
km("n", "<leader>t", ":ThesaurusQueryReplaceCurrentWord<cr>", opts)
km("n", "<leader>r", ":r! echo %:p<cr>", opts)
km("n", "<leader>k", ":ls<cr>:b<space>", opts)
km("n", "<leader>j", ":FzfLua files<cr>", opts)

-- buffer nav
km("n", "<C-n>", ":bnext<cr>:redraw<cr>", opts)
km("n", "<C-t>", ":bprevious<cr>:redraw<cr>", opts)

-- remove search highlight
km("n", "<leader><space>", ":noh<cr>", opts)

-- command line abbreviations
vim.cmd "cabbrev v vsp"
vim.cmd "cabbrev s sp"
vim.cmd "cabbrev f Files"

-- fix typo of :W for :w
vim.cmd "command W write"
vim.cmd "command Q quit"
vim.cmd "command Wq write | quit!"

--- stay in visual mode when indenting
km("v", "<", "<gv", opts)
km("v", ">", ">gv", opts)

-- move around splits with ctrl-[hjkl] in normal mode
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-l>", "<C-w>l", opts)

-- Move text up and down
km("x", "J", ":move '>+1<CR>gv-gv", opts)
km("x", "K", ":move '<-2<CR>gv-gv", opts)

-- change nvim behaviour of replacing buffer after ciw
km("v", "p", '"_dP', opts)
