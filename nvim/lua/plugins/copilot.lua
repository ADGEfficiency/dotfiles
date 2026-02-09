return {
	{
		"copilotlsp-nvim/copilot-lsp",
		init = function()
			vim.g.copilot_nes_debounce = 500
			vim.lsp.enable("copilot_ls")
			vim.keymap.set("n", "<tab>", function()
				local bufnr = vim.api.nvim_get_current_buf()
				local state = vim.b[bufnr].nes_state
				if state then
					-- Try to jump to the start of the suggestion edit.
					-- If already at the start, then apply the pending suggestion and jump to the end of the edit.
					local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
						or (
							require("copilot-lsp.nes").apply_pending_nes()
							and require("copilot-lsp.nes").walk_cursor_end_edit()
						)
					return nil
				else
					-- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
					return "<C-i>"
				end
			end, { desc = "Accept Copilot NES suggestion", expr = true })
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		requires = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				nes = {
					enabled = true,
					keymap = {
						accept_and_goto = "<leader>p",
						accept = false,
						dismiss = "<Esc>",
					},
				},
			})
			require("copilot.suggestion").toggle_auto_trigger()
		end,
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
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = true,
			context = "buffers",
			history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
			auto_follow_cursor = false,
			model = "gpt-4o",
		},
	},
}
