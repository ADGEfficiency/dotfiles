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
			popup = {
				enabled = false,
			},
			popupmenu = {
				enabled = true,
			},
			-- this is the messages that appear in top right
			notify = {
				enabled = false,
			},
			lsp = {
				signature = {
					enabled = false,
				},
				progress = {
					enabled = false,
				},
				message = {
					enabled = false,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = false,
				-- long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		})
	end,
}
