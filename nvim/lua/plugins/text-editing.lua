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
	{ "nvim-tree/nvim-web-devicons" },
	{ "tpope/vim-commentary" },
	{ "mattn/emmet-vim" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "farmergreg/vim-lastplace" },
	{ "axelf4/vim-strip-trailing-whitespace" },
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
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
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
