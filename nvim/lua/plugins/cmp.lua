return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"vrslev/cmp-pypi",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "toml",
	},
	{
		"hrsh7th/nvim-cmp",
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"echasnovski/mini.icons",
			"mikavilpas/blink-ripgrep.nvim",
			"moyiz/blink-emoji.nvim",
			"rafamadriz/friendly-snippets",
		},
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {

			keymap = { preset = "enter" },

			completion = {
				list = { selection = "auto_insert" },
				menu = {
					border = "single",
					auto_show = function()
						return vim.bo.buftype ~= "prompt"
							and vim.b.completion ~= false
							and vim.bo.filetype ~= "TelescopePrompt"
					end,
					draw = {
						columns = {
							{ "label", "label_description", gap = 3 },
							{ "kind_icon", gap = 1, "source_name", gap = 1, "kind" },
						},
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
									return kind_icon
								end,
								-- Optionally, you may also use the highlights from mini.icons
								highlight = function(ctx)
									local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
									return hl
								end,
							},
						},
					},
				},
			},

			appearance = {
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "path", "lsp", "snippets", "buffer", "ripgrep", "emoji" },
				cmdline = {},
				providers = {
					buffer = {
						name = "buffer",
						module = "blink.cmp.sources.buffer",
						max_items = 3,
					},
					lsp = {
						name = "lsp",
						module = "blink.cmp.sources.lsp",
						max_items = 3,
					},
					ripgrep = {
						name = "Ripgrep",
						module = "blink-ripgrep",
						max_items = 3,
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
		signature = { enabled = true },
	},
}
