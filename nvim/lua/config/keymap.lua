-- Keymaps

local opts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap

-- Disable leader in normal mode
km("n", ",", "<Nop>", opts)

-- Move up and down on display lines, not real lines
km("n", "j", "gj", opts)
km("n", "k", "gk", opts)

-- Move by actual lines with J and K
km("n", "<C-j>", "j", opts)
km("n", "<C-k>", "k", opts)

km("n", "<leader>a", ":ArgWrap<cr>", opts)
km("n", "<leader>r", ":r! echo %:p<cr>", opts)

-- Move to start / end of line
km("n", "L", "$", opts)
km("n", "H", "^", opts)

-- Keep cursor in middle when ctrl u + d
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Keep cursor in middle when moving between search matches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Remove search highlight
km("n", "<leader><space>", ":noh<cr>", opts)

-- Stay in visual mode when indenting
km("v", "<", "< gv", opts)
km("v", ">", "> gv", opts)

-- Buffer nav
km("n", "<C-n>", ":BufferNext<CR>", opts)
km("n", "<C-t>", ":BufferPrevious<CR>", opts)

-- Split nav
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-l>", "<C-w>l", opts)

-- Open linked file under cursor in new splits
km("n", "<leader>fs", ":split | ObsidianFollowLink<CR>", opts)
km("n", "<leader>fv", ":vsplit | ObsidianFollowLink<CR>", opts)

-- Open shell history
km("n", "<leader>h", ":sp ~/.zsh_history<cr>", opts)

-- Paste in path to open buffer
km("n", "<leader>r", ":r! echo %:p<cr>", opts)

-- Python
-- Format selection with Black
function Black_and_echo()
	vim.cmd(":'<,'>!black --quiet -")
	vim.cmd("echo 'black ran'")
end
km("v", "<leader>l", ":lua Black_and_echo()<cr>", opts)
-- Insert a Python breakpoint
km("n", "<leader>p", "A<CR>breakpoint()  # fmt: skip<ESC>", opts)
km("n", "<leader>p", "A<CR>import ipdb; ipdb.set_trace()  # fmt: skip<ESC>", opts)
-- Insert if name main
km("n", "<leader>m", 'A<CR>if __name__ == "__main__":<ESC>', opts)
-- Run current buffer in Python
km("n", "<F6>", ":!python %:p <cr>", opts)

-- Plugins

km("n", "<leader>a", ":ArgWrap<cr>", opts)
vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)
km("n", "<leader>w", ":WinResizerStartResize<cr>", opts)
km("v", "<leader>ll", ":Noice dismiss", opts)
vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)

-- Open grepper and search for current word
km("n", "<leader>g", ":Grepper -tool rg -noprompt -cword <CR>", opts)

-- Telescope
-- Search diagnostics
km(
	"n",
	"<leader>rd",
	":lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_ivy({}))<cr><cr>",
	opts
)
-- Search open buffers
km(
	"n",
	"<leader><leader>",
	":lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr><cr>",
	opts
)
-- Search for files in cwd
km(
	"n",
	"<leader>j",
	":lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr><cr>",
	opts
)
--- Search through recent files
km("n", "<leader>ro", ":lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_ivy({}))<cr><cr>", opts)
km("n", "<leader>rr", ":lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_ivy({}))<cr><cr>", opts)
-- Search for a string
km(
	"n",
	"<leader>rg",
	":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr><cr>",
	opts
)
-- Search for a string under cursor
km(
	"n",
	"<leader>rc",
	":lua require'telescope.builtin'.grep_string(require('telescope.themes').get_ivy({}))<cr><cr>",
	opts
)

-- Oil
vim.keymap.set("n", "<leader>o", "<CMD>split | Oil<CR>")

-- Misc / Unused / Broken

-- Move blocks of text up and down
km("x", "J", ":move '>+1<CR>gv-gv", opts)
km("x", "K", ":move '<-2<CR>gv-gv", opts)

-- change nvim behaviour of replacing buffer after ciw
km("v", "p", '"_dP', opts)

-- from https://youtu.be/w7i4amO_zaE
-- move selected blocks up and down with J and K
km("v", "J", ":m '>+1<CR>gv=gv", opts)
km("v", "K", ":m '>-2<CR>gv=gv", opts)
-- keep cursor in place when using J
km("n", "J", "mzJ`z", opts)
