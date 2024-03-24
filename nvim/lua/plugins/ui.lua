return {
	{ "nvim-web-devicons" },
	-- Buffers in top bar
	{
		"romgrk/barbar.nvim",
		dependencies = { "nvim-web-devicons" },
		config = function()
			local km = vim.api.nvim_set_keymap
			--
			-- automatic sort of buffers
			local opts = { noremap = true, silent = true }
			km("n", "<Leader>1", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
			km("n", "<Leader>2", "<Cmd>BufferOrderByDirectory<CR>", opts)

			require("barbar").setup({
				-- Enable/disable auto-hiding the tab bar when there is a single buffer
				auto_hide = false,
				clickable = false,
				icons = {
					-- Configure the base icons on the bufferline.
					-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
					buffer_index = true,
					buffer_number = false,
					button = "",
					filetype = {
						-- Sets the icon's highlight group.
						-- If false, will use nvim-web-devicons colors
						custom_colors = false,
						-- Requires `nvim-web-devicons` if `true`
						enabled = false,
					},
					separator = { left = "", right = "" },
					-- If true, add an additional separator at the end of the buffer list
					modified = { button = "" },
					separator_at_end = false,
					-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
					preset = "default",
					-- Configure the icons on the bufferline based on the visibility of a buffer.
					-- Supports all the base icon options, plus `modified` and `pinned`.
					alternate = { filetype = { enabled = false } },
					current = { buffer_index = true, button = "●", modified = { button = "●" } },
					visible = { modified = { buffer_number = false } },
				},
			})

			vim.cmd([[
        hi BufferCurrent gui=bold guibg='#282A36'
        hi BufferVisible guibg='#282A36'
        hi BufferInactive guibg='#282A36'
        hi BufferCurrentIndex guifg='#FF79C6' gui=bold
        hi BufferVisibleIndex guifg='#FF79C6' guibg='#282A36'
        hi BufferInactiveIndex guifg='#FF79C6' guibg='#282A36'
        hi BufferCurrentMod guifg='#51FA7B' gui=bold
        hi BufferVisibleMod guifg='#51FA7B' guibg='#282A36'
        hi BufferInactiveMod guifg='#51FA7B' guibg='#282A36'
        hi BufferCurrentSign guifg='#282A36' guibg='#282A36'
        hi BufferVisibleSign guifg='#282A36' guibg='#282A36'
        hi BufferInactiveSign guifg='#282A36' guibg='#282A36'
        hi BufferCurrentSignRight guifg='#282A36' guibg='#282A36'
        hi BufferVisibleSignRight guifg='#282A36' guibg='#282A36'
        hi BufferInactiveSignRight guifg='#282A36' guibg='#282A36'
        hi BufferTabpageFill guifg='#282A36'
      ]])

			vim.cmd([[
        cnoreabbrev b1 BufferGoto 1
        cnoreabbrev b2 BufferGoto 2
        cnoreabbrev b3 BufferGoto 3
        cnoreabbrev b4 BufferGoto 4
        cnoreabbrev b5 BufferGoto 5
        cnoreabbrev b6 BufferGoto 6
        cnoreabbrev b7 BufferGoto 7
        cnoreabbrev b8 BufferGoto 8
        cnoreabbrev b9 BufferGoto 9
        cnoreabbrev b10 BufferGoto 10
        cnoreabbrev b11 BufferGoto 11
        cnoreabbrev b12 BufferGoto 12
      ]])
		end,
	},
	-- Status line in bottom bar
	{ "nvim-lualine/lualine.nvim" },
	-- Buffer and window management
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
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
					add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "▎",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "▎",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "▎",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "▎",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
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
				current_line_blame_formatter_opts = {
					relative_time = false,
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
				yadm = {
					enable = false,
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
