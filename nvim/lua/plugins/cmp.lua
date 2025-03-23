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
			"giuxtaposition/blink-cmp-copilot",
			"fang2hou/blink-copilot",
			"moyiz/blink-emoji.nvim",
			"rafamadriz/friendly-snippets",
			"Kaiser-Yang/blink-cmp-dictionary",
			"nvim-lua/plenary.nvim",
			"zbirenbaum/copilot-cmp",
		},
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {

			keymap = {
				preset = "enter",
			},

			cmdline = {
				enabled = true,
				completion = {
					menu = { auto_show = true },
					ghost_text = { enabled = true },
				},
				keymap = {
					preset = "none",
					["<Tab>"] = { "select_and_accept" },
					["<C-n>"] = { "select_next" },
					["<C-p>"] = { "select_prev" },
					["<CR>"] = {
						"fallback",
						"select_accept_and_enter",
						"accept_and_enter",
					},
				},
			},

			completion = {
				list = {
					selection = { auto_insert = true, preselect = false },
				},
				menu = {
					cmdline_position = function()
						local Api = require("noice.api")
						local pos = Api.get_cmdline_position()
						return { pos.screenpos.row, pos.screenpos.col }
					end,
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
				default = {
					-- off on purpose - no copilot at home ^^
					-- TODO - turn on only on WSL/Ubuntu
					-- "copilot",
					"path",
					"lsp",
					"snippets",
					"buffer",
					"ripgrep",
					"emoji",
					"dictionary",
				},
				providers = {
					-- this does work
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						async = true,
						score_offset = 100,
						min_keyword_length = 0,
					},
					-- copilot = {
					-- 	name = "copilot",
					-- 	module = "blink-copilot",
					-- 	score_offset = 100,
					-- 	async = true,
					-- 	opts = {
					-- 		max_completions = 3,
					-- 		max_attempts = 4,
					-- 		debounce = false,
					-- 		auto_refresh = {
					-- 			backward = true,
					-- 			forward = true,
					-- 		},
					-- 	},
					-- },
					-- copilot = {
					-- 	name = "copilot-cmp",
					-- 	module = "blink.compat.source",
					-- },
					buffer = {
						name = "buffer",
						module = "blink.cmp.sources.buffer",
						max_items = 3,
					},
					snippets = {
						module = "blink.cmp.sources.snippets",
						name = "snippets",
						max_items = 3,
						opts = {
							search_paths = {
								"~/dotfiles/nvim/snippets/",
							},
						},
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
					dictionary = {
						module = "blink-cmp-dictionary",
						name = "Dict",
						min_keyword_length = 3,
						max_items = 3,
						opts = {
							dictionary_files = { "/usr/share/dict/words" },
						},
					},
				},
			},
		},
		opts_extend = { "sources.default" },
		signature = { enabled = true },
	},
}
