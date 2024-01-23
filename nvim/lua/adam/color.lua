-- Colors and themes

-- Color highlighter

require("colorizer").setup({
	"css",
	"javascript",
	html = {
		mode = "foreground",
	},
})

-- Dracula
vim.cmd([[
  try
    colorscheme dracula
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

-- Highlight spelling mistakes by linking SpellBad to ErrorMsg
vim.cmd([[hi! link SpellBad ErrorMsg]])
