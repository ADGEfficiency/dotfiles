return {
	{
		"dracula/vim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd([[set background=dark]])
			vim.cmd([[colorscheme dracula]])
			vim.cmd([[hi! link SpellBad Error]])
			vim.cmd([[hi! link SpellLocal DiagnosticWarn]])
			-- copilot next edit suggestions; plugin defaults link to Diff* which barely shows
			vim.api.nvim_set_hl(0, "CopilotLspNesAdd", { bg = "#2d4f3c" })
			vim.api.nvim_set_hl(0, "CopilotLspNesDelete", { bg = "#5c2b35", strikethrough = true })
			vim.api.nvim_set_hl(0, "CopilotLspNesApply", { bg = "#44475a", bold = true })
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
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
	{
		"rakr/vim-one",
	},
}
