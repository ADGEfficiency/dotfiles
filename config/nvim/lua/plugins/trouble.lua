return {
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = "Trouble",
		keys = {
			{ "<leader>gt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		},
		opts = {
			auto_open = false,
			auto_close = false,
			auto_preview = true,
			follow = true,
			focus = true,
			indent_guides = false,
			win = {
				size = { width = 50, height = 15 },
			},
			icons = {
				kinds = {
					Error = "",
					Warn = "",
					Hint = "",
					Info = "",
				},
				signs = {
					error = "󰥓",
					warn = "",
				},
			},
		},
	},
}
