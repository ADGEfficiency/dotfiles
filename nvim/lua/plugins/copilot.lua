return {
	{

		"zbirenbaum/copilot.lua",
		event = { "InsertEnter" },
		config = function()
			require("copilot").setup({
				panel = {
					enabled = false,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
						event = { "BufEnter" },
					},
				},
				suggestion = {
					enabled = false,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = "<M-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					python = true,
					markdown = true,
					yaml = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["*"] = true,
				},
				copilot_node_command = "node",
				server_opts_overrides = {},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = { "BufEnter" },
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = true,
			context = "buffers",
			history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
			auto_follow_cursor = false,
		},
	},
}
