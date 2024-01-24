return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"nvim-web-devicons",
			"zbirenbaum/copilot.lua",
			"zbirenbaum/copilot-cmp",
			"uga-rosa/cmp-dictionary",
			"amarakon/nvim-cmp-buffer-lines",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "dictionary" },
				{ name = "copilot" },
				-- { name = "buffer" },
			})

			opts.formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- icons
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						path = "[Path]",
						buffer = "[Buffer]",
						dictionary = "[Dict]",
						copilot = "[AI]",
					})[entry.source.name]
					-- names
					vim_item.kind = ({
						nvim_lsp = "󰒋",
						luasnip = "[Snippet]",
						path = "[Path]",
						buffer = "",
						dictionary = "[Dict]",
						copilot = "[AI]",
					})[entry.source.name]
					return vim_item
				end,
			}
			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- this way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})
		end,
	},
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" },
	{ "dmitmel/cmp-cmdline-history" },
	{ "hrsh7th/cmp-emoji" },
	{ "hrsh7th/cmp-latex-symbols" },
	{
		"uga-rosa/cmp-dictionary",
		opts = {
			dic = {
				["*"] = { "/usr/share/dict/words" },
				["python"] = { "~/dotfiles/dict/python.dic" },
			},
			exact_length = -1,
			first_case_insensitive = true,
			document = {
				enabled = false,
				command = { "wn", "${label}", "-over" },
			},
			async = true,
			max_number_items = 3,
		},
	},
	{ "David-Kunz/cmp-npm" },
	{ "amarakon/nvim-cmp-buffer-lines" },
	{
		"zbirenbaum/copilot.lua",
		opts = {
			panel = {
				enabled = false,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = false,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				python = true,
				markdown = true,
				yaml = true,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["*"] = true,
			},
			copilot_node_command = "/Users/adam/.nix-profile/bin/node",
			server_opts_overrides = {},
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
	},
}
