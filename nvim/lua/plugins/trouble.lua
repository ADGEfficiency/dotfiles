return {
	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				height = 5, -- height of the trouble list when position is top or bottom
				width = 50, -- width of the list when position is left or right
				icons = {
					error = "",
					warning = "",
					hint = "",
					information = "",
				},
				indent_lines = false, -- add an indent guide below the fold icons
				auto_open = false, -- automatically open the list when you have diagnostics
				auto_close = false, -- automatically close the list when you have no diagnostics
				signs = {
					error = "󰥓",
					warn = "",
				},
				use_diagnostic_signs = false,
			})
		end,
	},
}
