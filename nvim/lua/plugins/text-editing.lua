return {
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				theme = "light",
				app = "browser",
			})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{ "sindrets/diffview.nvim" },
	{ "mhinz/vim-grepper" },
	{ "FooSoft/vim-argwrap" },
	{ "mattn/emmet-vim" },
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = 1.0,
				width = 1.0,
				height = 1.0,
			},
			plugins = {
				options = {
					laststatus = 0,
				},
			},
		},
	},
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
	-- Text editing - Python
	{ "Vimjas/vim-python-pep8-indent" },
	--- Text editing - Markdown
	{ "dhruvasagar/vim-table-mode" },
	{ "dkarter/bullets.vim" },
	{ "mzlogin/vim-markdown-toc" },
	--- Text editing - HTML
	{ "alvan/vim-closetag" },
	{ "Glench/Vim-Jinja2-Syntax" },
	{
		"PedramNavid/dbtpal",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		ft = {
			"sql",
			"md",
			"yaml",
		},
		keys = {
			{ "<leader>drf", "<cmd>DbtRun<cr>" },
			{ "<leader>drp", "<cmd>DbtRunAll<cr>" },
			{ "<leader>dtf", "<cmd>DbtTest<cr>" },
			{ "<leader>dm", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
		},
		config = function()
			require("dbtpal").setup({
				path_to_dbt = "dbt",
				path_to_dbt_project = "",
				path_to_dbt_profiles_dir = "",
				extended_path_search = true,
				protect_compiled_files = true,
			})
			require("telescope").load_extension("dbtpal")
		end,
	},
}
