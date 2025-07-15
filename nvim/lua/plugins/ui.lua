return {
	{ "nvim-web-devicons" },
	{
		-- Buffers in top bar
		"romgrk/barbar.nvim",
		dependencies = { "nvim-web-devicons" },
		config = function()
			require("barbar").setup({
				auto_hide = false,
				clickable = false,
				icons = {
					buffer_index = true,
					buffer_number = false,
					button = "",
					filetype = {
						custom_colors = false,
						enabled = false,
					},
					separator = { left = "", right = "" },
					modified = { button = "" },
					separator_at_end = false,
					preset = "default",
					alternate = { filetype = { enabled = false } },
					current = {
						buffer_index = true,
					},
					visible = { modified = { buffer_index = true } },
				},
			})

			vim.cmd([[
        hi BufferCurrent gui=bold guibg='#282A36' guifg='#51FA7B'
        hi BufferCurrentIndex guifg='#FF79C6' gui=bold
        hi BufferCurrentMod gui=bold guibg='#282A36' guifg='#51FA7B'
        hi BufferCurrentSign guifg='#282A36' guibg='#282A36'
        hi BufferCurrentSignRight guifg='#282A36' guibg='#282A36'
        hi BufferInactive guibg='#282A36' guifg=#6272a4
        hi BufferInactiveIndex guifg='#FF79C6' guibg='#282A36'
        hi BufferInactiveMod guibg='#282A36' guifg=#f8f8f2
        hi BufferInactiveSign guifg='#282A36' guibg='#282A36'
        hi BufferInactiveSignRight guifg='#282A36' guibg='#282A36'
        hi BufferTabpageFill guifg='#282A36'
        hi BufferVisible guibg='#282A36'
        hi BufferVisibleIndex guifg='#FF79C6' guibg='#282A36'
        hi BufferVisibleMod guibg='#282A36' guifg=#f8f8f2
        hi BufferVisibleSign guifg='#282A36' guibg='#282A36'
        hi BufferVisibleSignRight guifg='#282A36' guibg='#282A36'
      ]])

			opts = {}
			vim.api.nvim_set_keymap("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>", opts)
			vim.api.nvim_set_keymap("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>", opts)
		end,
	},
	{
		-- Buffer and window management
		"kevinhwang91/nvim-bqf",
		ft = "qf",
	},
	{ "simeji/winresizer" },
	{ "qpkorr/vim-bufkill" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local status_ok, gitsigns = pcall(require, "gitsigns")
			if not status_ok then
				return
			end

			gitsigns.setup({
				signs = {
					add = { text = "▎" },
					change = {
						text = "▎",
					},
					delete = {
						text = "▎",
					},
					topdelete = {
						text = "▎",
					},
					changedelete = {
						text = "▎",
					},
				},
				-- Toggle with `:Gitsigns toggle_signs`
				signcolumn = true,
				-- Toggle with `:Gitsigns toggle_numhl`
				numhl = true,
				-- Toggle with `:Gitsigns toggle_linehl`
				linehl = false,
				-- Toggle with `:Gitsigns toggle_word_diff`
				word_diff = false,
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				-- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 1000,
					ignore_whitespace = false,
				},
				sign_priority = 6,
				update_debounce = 100,
				-- Use default
				status_formtter = nil,
				max_file_length = 40000,
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "nightfly",
					icons_enabled = true,
					section_separators = { left = " ", right = " " },
					component_separators = { left = " ", right = " " },
					disabled_filetypes = {},
					always_divide_middle = true,
					globalstatus = false,
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return str:sub(1, 1)
							end,
						},
					},
					lualine_b = {
						{
							"diagnostics",
							colored = true,
							symbols = { error = "󰥓 ", warn = " ", info = "", hint = "" },
							sections = { "error", "warn" },
							update_in_insert = true,
							always_visible = true,
						},
						{
							"diff",
							colored = true,
							symbols = { added = " ", modified = " ", removed = " " },
							always_visible = true,
						},
					},
					lualine_c = {
						{
							"filetype",
							colored = true,
							icon = { "" },
						},
						{
							"filename",
							colored = true,
							path = 3,
							symbols = { modified = " ", readonly = " ", shorting_target = 4 },
						},
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "progress", "location" },
				},
				tabline = {},
				extensions = { "fzf" },
			})
		end,
	},
}
