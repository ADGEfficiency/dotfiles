return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				["*"] = true,
				cvs = false,
				gitcommit = false,
				gitrebase = false,
				help = true,
				hgcommit = false,
				lua = true,
				markdown = true,
				python = true,
				svn = false,
				yaml = true,
			},
		},
	},
	-- 	{
	-- 		"CopilotC-Nvim/CopilotChat.nvim",
	-- 		branch = "main",
	-- 		dependencies = {
	-- 			{ "zbirenbaum/copilot.lua" },
	-- 			{ "nvim-lua/plenary.nvim" },
	-- 		},
	-- 		opts = {
	-- 			system_prompt = [[You are an expert software engineer.
	-- - Provide clear, concise explanations
	-- - Include comments only if necessary
	-- - Include functions only if necessary
	-- - Include docstrings
	-- - All Python code should pass strict type checking]],
	-- 			debug = true,
	-- 			context = "buffers",
	-- 			history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
	-- 			auto_follow_cursor = false,
	-- 			model = "gpt-4o",
	-- 			sticky = "@copilot",
	-- 			auto_fold = false,
	-- 			auto_insert_mode = true,
	-- 		},
	-- 	},
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		opts = {
			chat = {
				adapter = {
					name = "copilot",
					model = "claude-sonnet-4.6",
				},
				inline = {
					adapter = "copilot",
					model = "claude-sonnet-4.6",
				},
				cmd = {
					adapter = "copilot",
					model = "claude-sonnet-4.6",
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "codecompanion" },
	},
}
