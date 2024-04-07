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
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- Optional
			{
				"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
				opts = {},
			},
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					anthropic = require("codecompanion.adapters").use("anthropic"),
					ollama = require("codecompanion.adapters").use("ollama", {
						schema = {
							model = {
								default = "mistral",
							},
						},
					}),
					openai = require("codecompanion.adapters").use("openai"),
				},
				strategies = {
					chat = "openai",
					inline = "openai",
				},
				saved_chats = {
					save_dir = vim.fn.stdpath("data") .. "/codecompanion/saved_chats", -- Path to save chats to
				},
				display = {
					action_palette = {
						width = 95,
						height = 10,
					},
					chat = { -- Options for the chat strategy
						type = "float", -- float|buffer
						show_settings = true, -- Show the model settings in the chat buffer?
						show_token_count = true, -- Show the token count for the current chat in the buffer?
						buf_options = { -- Buffer options for the chat buffer
							buflisted = false,
						},
						float_options = { -- Float window options if the type is "float"
							border = "single",
							buflisted = false,
							max_height = 0,
							max_width = 0,
							padding = 1,
						},
						win_options = { -- Window options for the chat buffer
							cursorcolumn = false,
							cursorline = false,
							foldcolumn = "0",
							linebreak = true,
							list = false,
							signcolumn = "no",
							spell = false,
							wrap = true,
						},
					},
				},
				keymaps = {
					["<C-s>"] = "keymaps.save", -- Save the chat buffer and trigger the API
					["<C-c>"] = "keymaps.close", -- Close the chat buffer
					["q"] = "keymaps.cancel_request", -- Cancel the currently streaming request
					["gc"] = "keymaps.clear", -- Clear the contents of the chat
					["ga"] = "keymaps.codeblock", -- Insert a codeblock into the chat
					["gs"] = "keymaps.save_chat", -- Save the current chat
					["]"] = "keymaps.next", -- Move to the next header in the chat
					["["] = "keymaps.previous", -- Move to the previous header in the chat
				},
				log_level = "ERROR", -- TRACE|DEBUG|ERROR
				send_code = true, -- Send code context to the generative AI service? Disable to prevent leaking code outside of Neovim
				silence_notifications = false, -- Silence notifications for actions like saving saving chats?
				use_default_actions = true, -- Use the default actions in the action palette?
			})
		end,
	},
}
