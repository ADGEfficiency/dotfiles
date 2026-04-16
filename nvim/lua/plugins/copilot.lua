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
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		opts = {
			interactions = {
				chat = {
					adapter = {
						name = "copilot",
						model = "claude-sonnet-4.6",
					},
					keymaps = {
						send = {
							callback = function(chat)
								vim.cmd("stopinsert")
								chat:add_buf_message({ role = "llm", content = "" })
								chat:submit()
							end,
							index = 1,
							description = "Send",
						},
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
		},
		config = function(_, opts)
			require("config.codecompanion_spinner"):init()
			require("codecompanion").setup(opts)
		end,
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
