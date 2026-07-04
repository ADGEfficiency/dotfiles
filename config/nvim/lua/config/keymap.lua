-- Keymaps

local opts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap

-- Disable leader in normal mode
km("n", ",", "<Nop>", opts)

-- Move up and down on display lines, not real lines
km("n", "j", "gj", opts)
km("n", "k", "gk", opts)

-- Copy entire file
km("n", "YY", ":%y<cr>", opts)

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

-- Insert current file path
km("n", "<leader>r", ":r! echo %:p<cr>", opts)

-- Rebalance windows
km("n", "<leader>b", "<C-w>=<cr>", opts)

-- Python
-- Format selection with Black
function Black_and_echo()
	vim.cmd(":'<,'>!black --quiet -")
	vim.cmd("echo 'black ran'")
end
km("v", "<leader>l", ":lua Black_and_echo()<cr>", opts)
-- Insert a Python breakpoint
km("n", "<leader>p", "A<CR>breakpoint()  # fmt: skip<ESC>", opts)
-- Insert if name main
km("n", "<leader>m", 'A<CR>if __name__ == "__main__":<ESC>', opts)
-- Run current buffer in Python
km("n", "<F6>", ":!python %:p <cr>", opts)

-- mini.surround help
vim.keymap.set("n", "<leader>?s", function()
	print("Surround: sa{motion}{char} add | ds{char} delete | cs{old}{new} replace")
end, { desc = "Surround help" })

-- Plugins

km("n", "<leader>a", ":ArgWrap<cr>", opts)
vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)
km("n", "<leader>w", ":WinResizerStartResize<cr>", opts)
km("v", "<leader>ll", ":Noice dismiss", opts)

-- Telescope
-- Search diagnostics
km("n", "<leader>rd", ":lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_ivy({}))<cr>", opts)
-- Search open buffers
km(
	"n",
	"<leader><leader>",
	":lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>",
	opts
)
-- Search for files in cwd
km("n", "<leader>j", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>", opts)
--- Search through recent files
km("n", "<leader>'", ":lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_ivy({}))<cr>", opts)
km("n", "<leader>ro", ":lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_ivy({}))<cr>", opts)
km("n", "<leader>rr", ":lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_ivy({}))<cr>", opts)
-- Search for a string
km("n", "<leader>rg", ":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>", opts)
-- Search for a string under cursor
km("n", "<leader>rc", ":lua require'telescope.builtin'.grep_string(require('telescope.themes').get_ivy({}))<cr>", opts)
-- Search for current word
vim.keymap.set("n", "<leader>g", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
		hidden = true,
		default_text = vim.fn.expand("<cword>"),
	}))
end, opts)
vim.keymap.set("n", "<leader>.", function()
	require("telescope.builtin").grep_string(require("telescope.themes").get_ivy({ hidden = true }))
end, opts)

-- Oil
vim.keymap.set("n", "<leader>o", "<CMD>split | Oil<CR>")

-- CopilotChat
vim.keymap.set("n", "<leader>c", ":CodeCompanionChat<CR>")

-- ZenMode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- Misc / Unused / Broken

-- change nvim behaviour of replacing buffer after ciw
km("v", "p", '"_dP', opts)
