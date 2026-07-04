vim.opt_local.foldenable = true
vim.opt_local.foldlevel = 6

-- Shift+Enter: new bullet, indented one level deeper (requires kitty keyboard protocol)
vim.keymap.set("i", "<S-CR>", "<Plug>(bullets-newline)<Plug>(bullets-demote)", { buffer = true, remap = true })
