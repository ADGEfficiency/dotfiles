local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local km = vim.api.nvim_set_keymap

-- leader
km("n", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

km("n", "<leader>a", ":ArgWrap<cr>", opts)
km("n", "<leader>c", ":Telescope find_files cwd=~/.nb/home<CR>", opts)
km("n", "<leader>r", ":r! echo %:p<cr>", opts)

-- km(
--   "v",
--   "<leader>l",
--   "/Users/adam/.pyenv/versions/3.10.6/envs/general/bin/black - | :echo 'black ran'",
--   opts
-- )
function black_and_echo()
  vim.cmd(":'<,'>!$PYENV_GENERAL/black --quiet -")
  vim.cmd("echo 'black ran'")
end

km("v", "<leader>l", ":lua black_and_echo()<cr>", opts)

vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)
-- $HOME/.pyenv/versions/3.10.6/envs/general/bin/black - <CR>", opts)
-- move to start / end of line
km("n", "L", "$", opts)
km("n", "H", "^", opts)

km("n", "<leader>k", ":lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>", opts)
km("n", "<leader>j", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>", opts)
km("n", "<leader>x", ":lua require'telescope.builtin'.oldfiles(require('telescope.themes').get_ivy({}))<cr><cr>", opts)
km("n", "<leader>b", ":sp ~/.zsh_history<cr>", opts)
km("n", "<leader>w", ":WinResizerStartResize<cr>", opts)

km("n", "<leader>p", "A<CR>breakpoint()  # fmt: skip<ESC>", opts)
km("n", "<leader>m", 'A<CR>if __name__ == "__main__":<ESC>', opts)

-- buffer nav
-- km("n", "<C-n>", ":bnext<cr>:redraw<cr>", opts)
-- km("n", "<C-t>", ":bprevious<cr>:redraw<cr>", opts)
km("n", "<C-n>", ":BufferNext<CR>", opts)
km("n", "<C-t>", ":BufferPrevious<CR>", opts)
-- km("n", "<C-t>", ":lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>", opts)

-- remove search highlight
km("n", "<leader><space>", ":noh<cr>", opts)

-- command line abbreviations
vim.cmd("cabbrev v vsp")
vim.cmd("cabbrev s sp")
vim.cmd("cabbrev f Telescope find_files cwd=")
vim.cmd("cabbrev t Telescope")

-- fix typo of :W for :w
vim.cmd("command W write")
vim.cmd("command Q quit")
vim.cmd("command Wq write | quit!")

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

-- run python file
km("n", "<F6>", ":!python %:p <cr>", opts)

-- move up and down on display lines, not real lines
km("n", "j", "gj", opts)
km("n", "k", "gk", opts)

--- open grepper and search for current word
km("n", "<leader>g", ":Grepper -tool rg -noprompt -cword <CR>", opts)

-- from https://youtu.be/w7i4amO_zaE
-- move selected blocks up and down with J and K
km("v", "J", ":m '>+1<CR>gv=gv", opts)
km("v", "K", ":m '>-2<CR>gv=gv", opts)
-- keep cursor in place when using J
km("n", "J", "mzJ`z", opts)
-- keep cursor in middle when ctrl u + d
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- keep cursor in middle when moving between search matches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
