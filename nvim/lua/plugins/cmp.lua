return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"Kaiser-Yang/blink-cmp-dictionary",
			"echasnovski/mini.icons",
			"giuxtaposition/blink-cmp-copilot",
			"mikavilpas/blink-ripgrep.nvim",
			"moyiz/blink-emoji.nvim",
			"nvim-lua/plenary.nvim",
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			snippets = { preset = 'luasnip' },

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
				documentation = {
					-- Controls whether the documentation window will automatically show when selecting a completion item
					auto_show = false,
					-- Delay before showing the documentation window
					auto_show_delay_ms = 0,
					-- Delay before updating the documentation window when selecting a new item,
					-- while an existing item is still visible
					update_delay_ms = 50,
					-- Whether to use treesitter highlighting, disable if you run into performance issues
					treesitter_highlighting = true,
					-- Draws the item in the documentation window, by default using an internal treesitter based implementation
					draw = function(opts)
						opts.default_implementation()
					end,
					window = {
						min_width = 10,
						max_width = 80,
						max_height = 20,
						border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
						winblend = 0,
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
						-- Note that the gutter will be disabled when border ~= 'none'
						scrollbar = true,
						-- Which directions to show the documentation window,
						-- for each of the possible menu window directions,
						-- falling back to the next direction when there's not enough space
						direction_priority = {
							menu_north = { "e", "w", "n", "s" },
							menu_south = { "e", "w", "s", "n" },
						},
					},
				},

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

			signature = {
				enabled = true,
				trigger = {
					enabled = true,
					show_on_keyword = true,
					show_on_insert = true,
					show_on_insert_on_trigger_character = true,
				},
				window = {
					min_width = 1,
					max_width = 400,
					max_height = 10,
					border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
					winblend = 0,
					winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
					scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
					-- Which directions to show the window,
					-- falling back to the next direction when there's not enough space,
					-- or another window is in the way
					direction_priority = { "n", "s" },
					-- Disable if you run into performance issues
					treesitter_highlighting = true,
					show_documentation = true,
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
					"copilot",
					"path",
					"lsp",
					"snippets",
					"buffer",
					"ripgrep",
					"emoji",
					"dictionary",
				},
				per_filetype = {
					markdown = {
						"copilot",
						"path",
						"lsp",
						"snippets",
						"buffer",
						"ripgrep",
						"emoji",
						"dictionary",
					},
					go = {
						"path",
						"lsp",
						"snippets",
						"buffer",
						"ripgrep",
					},
					python = {
						"copilot",
						"path",
						"lsp",
						"snippets",
						"buffer",
						"ripgrep",
					},
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
					path = {
						opts = {
							get_cwd = function(_)
								return vim.fn.getcwd()
							end,
						},
					},
					lsp = {
						name = "lsp",
						module = "blink.cmp.sources.lsp",
						max_items = 3,
					},
					buffer = {
						name = "buffer",
						module = "blink.cmp.sources.buffer",
						max_items = 3,
						opts = {
							get_bufnrs = function()
								return vim.tbl_filter(function(bufnr)
									return vim.bo[bufnr].buftype == ""
								end, vim.api.nvim_list_bufs())
							end,
						},
					},
					snippets = {
						module = "blink.cmp.sources.snippets",
						name = "snippets",
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
	},
}