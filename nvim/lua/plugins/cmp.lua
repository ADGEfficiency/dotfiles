return {
	{
		"vrslev/cmp-pypi",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "toml",
	},
	{
		"hrsh7th/nvim-cmp",
		-- event = {
		-- 	"BufReadPost",
		-- 	"BufNewFile",
		-- 	"InsertEnter",
		-- },
		dependencies = {
			"L3MON4D3/LuaSnip",
			"dmitmel/cmp-cmdline-history",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"uga-rosa/cmp-dictionary",
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag",
			"davidsierradz/cmp-conventionalcommits",
			"vrslev/cmp-pypi",
			"amarakon/nvim-cmp-buffer-lines",
		},
		config = function()
			require("nvim-autopairs").setup()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			require("cmp_dictionary").setup({
				paths = { "/usr/share/dict/words" },
				exact_length = 2,
				first_case_insensitive = true,
				document = {
					enabled = true,
					command = { "wn", "${label}", "-over" },
				},
			})
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip/loaders/from_snipmate").load({ paths = "~/dotfiles/nvim/snippets" })

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item()
						else
							cmp.complete()
						end
					end, { "i", "c" }),
					["<C-n>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_next_item()
						else
							cmp.complete()
						end
					end, { "i", "c" }),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						-- elseif luasnip.expand_or_jumpable() then
						-- 	luasnip.expand_or_jump()
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
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp_signature_help" },
					{ name = "copilot", max_item_count = 2 },
					{ name = "luasnip", max_item_count = 3 },
					{ name = "nvim_lsp", max_item_count = 5 },
					{ name = "path", max_item_count = 5 },
					{
						name = "buffer",
						max_item_count = 5,
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
					},
					{ name = "emoji", max_item_count = 5 },
					{ name = "latex_symbols", max_item_count = 5 },
					{ name = "npm", max_item_count = 5 },
					{ name = "dictionary", max_item_count = 5, keyword_length = 3 },
					{ name = "buffer-lines", option = { max_item_count = 2, words = true, comments = true } },
					{ name = "pypi", keyword_length = 4 },
				}),
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					expandable_indicator = true,
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						symbol_map = {
							Copilot = "",
						},
						menu = {
							nvim_lsp = "[LSP]",
							luasnip = "[Snip]",
							path = "[Path]",
							buffer = "[Buff]",
							dictionary = "[Dict]",
							copilot = "[AI]",
							conventionalcommits = "[Git]",
						},
					}),
				},
				experimental = {
					ghost_text = true,
				},
			})
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "conventionalcommits" },
					{ name = "buffer", max_item_count = 5 },
					{ name = "emoji", max_item_count = 5 },
				}),
			})
		end,
	},
}
