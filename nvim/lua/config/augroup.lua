-- Augroups

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("yank-highlight", { clear = True }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
})

-- Filetype Specific

-- .jinja.html
vim.cmd("au BufRead,BufNewFile *.jinja setfiletype jinja.html")

-- .bats
-- Set the filetype for *.bats files to sh
vim.cmd("au BufRead,BufNewFile *.bats setfiletype sh")

-- .env
-- Detect .env-* files and set their filetype to sh
vim.cmd([[
augroup filetype_env
  autocmd!
  autocmd BufRead,BufNewFile .env-* setfiletype sh
  autocmd BufRead,BufNewFile .env.* setfiletype sh
augroup END
]])

-- .md
vim.opt.spell = false
local markdown_group = vim.api.nvim_create_augroup("markdown", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	group = markdown_group,
	callback = function()
		vim.opt_local.syntax = "markdown"
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "en_nz" }
		vim.opt_local.spellfile = vim.fn.expand("~/dotfiles/nvim/spell/en.utf-8.add")
		vim.opt_local.autoindent = false
		vim.opt_local.smartindent = false
		vim.opt_local.expandtab = true
		vim.g.indentLine_enabled = 0
		vim.cmd([[syntax keyword Todo TODO DONE]])
		vim.opt.complete:append("k")
		vim.opt_local.conceallevel = 0
	end,
})

-- .py
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.cmd("highlight ColorColumn cterm=bold ctermbg=238 gui=bold guibg=#424450")
	end,
})
