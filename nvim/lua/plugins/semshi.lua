return {
	{
		"wookayin/semshi", -- Maintained fork with Python 3.13 support
		ft = "python", -- Only load for Python files
		build = ":UpdateRemotePlugins",
		init = function()
			-- Disable default builtin highlighting (let semshi handle it)
			vim.g["semshi#no_default_builtin_highlight"] = true

			-- Simplify markup for better integration with semshi
			vim.g["semshi#simplify_markup"] = true

			-- Mark selected nodes (same name and scope as cursor)
			vim.g["semshi#mark_selected_nodes"] = 1

			-- Show error signs in the sign column
			vim.g["semshi#error_sign"] = true
			vim.g["semshi#error_sign_delay"] = 1.5

			-- Update all highlights for every change (more reliable)
			vim.g["semshi#always_update_all_highlights"] = false

			-- Tolerate syntax errors while typing
			vim.g["semshi#tolerate_syntax_errors"] = true

			-- Prefer self.foo over self when selecting
			vim.g["semshi#self_to_attribute"] = true

			-- Filetypes to enable semshi on
			vim.g["semshi#filetypes"] = { "python" }
		end,
		config = function()
			-- Custom highlights (optimized for dark backgrounds)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = function()
					vim.cmd([[
						hi semshiLocal           ctermfg=209 guifg=#ff875f
						hi semshiGlobal          ctermfg=214 guifg=#ffaf00
						hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
						hi semshiParameter       ctermfg=75  guifg=#5fafff
						hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
						hi semshiFree            ctermfg=218 guifg=#ffafd7
						hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
						hi semshiAttribute       ctermfg=49  guifg=#00ffaf
						hi semshiSelf            ctermfg=249 guifg=#b2b2b2
						hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
						hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

						hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
						hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
						sign define semshiError text=E> texthl=semshiErrorSign
					]])
				end,
			})

			-- Persist highlights across colorscheme changes
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.cmd([[
						hi semshiLocal           ctermfg=209 guifg=#ff875f
						hi semshiGlobal          ctermfg=214 guifg=#ffaf00
						hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
						hi semshiParameter       ctermfg=75  guifg=#5fafff
						hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
						hi semshiFree            ctermfg=218 guifg=#ffafd7
						hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
						hi semshiAttribute       ctermfg=49  guifg=#00ffaf
						hi semshiSelf            ctermfg=249 guifg=#b2b2b2
						hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
						hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

						hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
						hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
					]])
				end,
			})

			-- Keymaps for semshi (only in Python files)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "python",
				callback = function()
					local opts = { noremap = true, silent = true, buffer = true }

					-- Rename symbol under cursor
					vim.keymap.set("n", "<leader>rr", ":Semshi rename<CR>", opts)

					-- Navigate between related names
					vim.keymap.set("n", "<Tab>", ":Semshi goto name next<CR>", opts)
					vim.keymap.set("n", "<S-Tab>", ":Semshi goto name prev<CR>", opts)

					-- Navigate between classes
					vim.keymap.set("n", "<leader>c", ":Semshi goto class next<CR>", opts)
					vim.keymap.set("n", "<leader>C", ":Semshi goto class prev<CR>", opts)

					-- Navigate between functions
					vim.keymap.set("n", "<leader>f", ":Semshi goto function next<CR>", opts)
					vim.keymap.set("n", "<leader>F", ":Semshi goto function prev<CR>", opts)

					-- Jump to unresolved names and unused parameters
					vim.keymap.set("n", "<leader>gu", ":Semshi goto unresolved first<CR>", opts)
					vim.keymap.set("n", "<leader>gp", ":Semshi goto parameterUnused first<CR>", opts)

					-- Error navigation
					vim.keymap.set("n", "<leader>ee", ":Semshi error<CR>", opts)
					vim.keymap.set("n", "<leader>ge", ":Semshi goto error<CR>", opts)
				end,
			})
		end,
	},
}
