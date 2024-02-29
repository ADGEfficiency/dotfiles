return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
			},
			messages = {
				enabled = false,
			},
			popup = {
				enabled = false,
			},
			popupmenu = {
				enabled = true,
			},
			lsp = {
				progress = {
					enabled = false,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		})
	end,
}
