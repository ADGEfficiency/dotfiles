local km = vim.api.nvim_set_keymap
-- automatic sort of buffers
local opts = { noremap = true, silent = true }
km("n", "<Leader>1", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
km("n", "<Leader>2", "<Cmd>BufferOrderByDirectory<CR>", opts)

require("bufferline").setup({
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
		current = { buffer_index = true },
		visible = { modified = { buffer_number = false } },
	},
})

vim.cmd([[

  hi BufferCurrentIndex guifg='#FF79C6' gui=bold
  hi BufferVisibleIndex guifg='#FF79C6' guibg='#282A36'
  hi BufferInactiveIndex guifg='#FF79C6' guibg='#282A36'

  hi BufferCurrent gui=bold guibg='#282A36'
  hi BufferVisible guibg='#282A36'
  hi BufferInactive guibg='#282A36'

  hi BufferCurrentMod guifg='#51FA7B' gui=bold
  hi BufferVisibleMod guifg='#51FA7B' guibg='#282A36'
  hi BufferInactiveMod guifg='#51FA7B' guibg='#282A36'

  hi BufferTabpageFill guifg='#282A36'
]])

vim.cmd([[
  cnoreabbrev bg BufferGoto
  cnoreabbrev BG BufferGoto
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
]])
