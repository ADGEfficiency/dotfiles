return {
	{
		"dracula/vim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd([[colorscheme dracula]])
			vim.cmd([[hi! link SpellBad Error]])
			vim.cmd([[hi! link SpellLocal DiagnosticWarn]])
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"css",
				"javascript",
				html = {
					mode = "foreground",
				},
			})
		end,
	},
}
