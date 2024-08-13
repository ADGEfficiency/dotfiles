return {
	{ "mhinz/vim-grepper" },
	{ "FooSoft/vim-argwrap" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "tpope/vim-commentary" },
	{ "mattn/emmet-vim" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "farmergreg/vim-lastplace" },
	{ "axelf4/vim-strip-trailing-whitespace" },

	{ "folke/zen-mode.nvim" },
	{
		"mbbill/undotree",
		config = function()
			-- Set undotree to focus when toggled
			vim.g.undotree_SetFocusWhenToggle = 1
			-- Disable automatic opening of the undotree diff window
			vim.g.undotree_DiffAutoOpen = 0
			-- Use short indicators in the undotree
			vim.g.undotree_ShortIndicators = 1
		end,
	},
	{ "norcalli/nvim-colorizer.lua" },
	{ "windwp/nvim-ts-autotag" },
	{ "kana/vim-textobj-user" },
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
		main = "ibl",
	},
	{
		"echasnovski/mini.indentscope",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
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
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		config = true,
  -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
