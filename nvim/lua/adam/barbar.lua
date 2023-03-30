local km = vim.api.nvim_set_keymap
-- automatic sort of buffers
local opts = { noremap = true, silent = true }
km("n", "<Leader>1", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
km("n", "<Leader>2", "<Cmd>BufferOrderByDirectory<CR>", opts)

require("bufferline").setup({
	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = false,
	clickable = false,
	closable = false,
	icons = "numbers",
	icon_separator_active = "",
	icon_separator_inactive = "",
})

vim.cmd([[
  hi BufferCurrent guifg=white
  hi BufferCurrentMod guifg='#51FA7B'
  hi BufferCurrentSign guifg='#00BFFF'
  hi BufferCurrentIcon guibg='#3E4452'
  hi BufferVisibleMod guifg='#51FA7B' guibg='#282A36'
  hi BufferTabPages guifg=white
  hi BufferTabpageFill guifg='#343434'
  hi BufferInactive guifg='#6272A4' guibg='#282A36'
  hi BufferInactiveIndex guifg='#6272A4' guibg='#282A36'
  hi BufferInactiveMod guifg='#51FA7B' guibg='#282A36'
  hi BufferInactiveTarget guifg='#6272A4' guibg='#282A36'
  hi BufferInactiveSign guifg='#6272A4' guibg='#282A36'
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
]])
