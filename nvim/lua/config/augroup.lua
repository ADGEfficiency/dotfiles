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

-- .py
vim.api.nvim_create_augroup("NoSpellForCode", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "NoSpellForCode",
	pattern = { "python", "go" },
	callback = function()
    vim.opt_local.spell = false
    if vim.bo.filetype == "python" then
      vim.opt_local.colorcolumn = "88"
    end
  end
})
