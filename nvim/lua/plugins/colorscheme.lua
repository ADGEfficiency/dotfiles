return {
	{
		"dracula/vim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.cmd([[colorscheme dracula]])
		end,
	},
}
