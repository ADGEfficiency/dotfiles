return {
	{ "mhinz/vim-grepper" },
	{ "FooSoft/vim-argwrap" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "tpope/vim-commentary" },
	{ "mattn/emmet-vim" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "lewis6991/gitsigns.nvim" },
	{ "farmergreg/vim-lastplace" },
	{ "axelf4/vim-strip-trailing-whitespace" },
	{ "mbbill/undotree" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "windwp/nvim-ts-autotag" },
	{ "kana/vim-textobj-user" },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			-- Define a custom highlight group for indent lines
			vim.api.nvim_set_hl(0, "CustomIndent", { fg = "#6272A4" })
			-- Setup indent-blankline with the custom highlight group
			require("ibl").setup({
				indent = {
					char = "┆",
					highlight = { "CustomIndent" }, -- Using the custom highlight group
				},
			})
		end,
	},
	-- Text editing - Python
	{ "Vimjas/vim-python-pep8-indent" },
	{ "bps/vim-textobj-python" },
	--- Text editing - Markdown
	{ "coachshea/vim-textobj-markdown" },
	{ "dhruvasagar/vim-table-mode" },
	{ "dkarter/bullets.vim" },
	{ "mzlogin/vim-markdown-toc" },
	--- Text editing - HTML
	{ "alvan/vim-closetag" },
	{ "Glench/Vim-Jinja2-Syntax" },
}
