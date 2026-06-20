return {
	"preservim/vim-markdown",
	ft = "markdown",
	init = function()
		vim.g.vim_markdown_folding_disabled = 1
		vim.g.vim_markdown_folding_level = 6
		vim.g.vim_markdown_frontmatter = 1
		vim.g.vim_markdown_no_default_key_mappings = 1
		vim.g.vim_markdown_folding_style_pythonic = 1
		vim.g.vim_markdown_auto_insert_bullets = 0
		vim.g.vim_markdown_new_list_item_indent = 0
		vim.g.vim_markdown_conceal = 0
		vim.g.vim_markdown_conceal_code_blocks = 0
	end,
}
