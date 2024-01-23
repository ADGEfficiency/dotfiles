-- Autocompletion

-- Check if 'cmp' (completion-nvim) and 'luasnip' (LuaSnip) are available
local cmp_status_ok, cmp = pcall(require, "cmp")
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not cmp_status_ok or not snip_status_ok then
	return
end
--
-- Load snippets from the 'snippets' directory for LuaSnip
require("luasnip/loaders/from_snipmate").load({ paths = "./snippets" })

--   פּ ﯟ   some other good icons - more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰫧",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
	Copilot = "󰚩",
}

-- Set up 'cmp' for different command-line types
-- Includes setting up sources
for _, cmd_type in ipairs({ ":", "/", "?", "@" }) do
	cmp.setup.cmdline(cmd_type, {
		sources = cmp.config.sources({
			{ name = "cmdline" },
			{ name = "cmdline_history" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "copilot" },
			{ name = "dictionary" },
		}),
	})
end

require("cmp_dictionary").setup({
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
})

-- Set up 'cmp'
-- Includes setting up sources
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
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
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
			-- that way you will only jump inside the snippet region
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
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				path = "[Path]",
				buffer = "[Buffer]",
				dictionary = "[Dict]",
				copilot = "[AI]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "copilot" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{
			name = "path",
			option = {
				get_cwd = function(params)
					return vim.fn.getcwd()
				end,
			},
		},
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "emoji" },
		{ name = "latex_symbols" },
		{ name = "npm", keyword_length = 4 },
		{
			name = "dictionary",
			keyword_length = 3,
			max_item_count = 3,
		},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
})

cmp.setup.filetype("python", {
	sources = {
		{ name = "copilot" },
		{ name = "luasnip" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{
			name = "path",
			option = {
				get_cwd = function(params)
					return vim.fn.getcwd()
				end,
			},
		},
		{ name = "nvim_lsp" },
		{
			name = "dictionary",
			keyword_length = 4,
			max_item_count = 3,
		},
	},
})

cmp.setup.filetype("markdown", {
	sources = {
		{ name = "copilot" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{
			name = "path",
			option = {
				get_cwd = function(params)
					return vim.fn.getcwd()
				end,
			},
		},
		{ name = "buffer-lines", option = { words = true, comments = true } },
		{
			name = "dictionary",
			keyword_length = 4,
			max_item_count = 3,
		},
		{ name = "luasnip" },
	},
})

cmp.event:on("menu_opened", function()
	vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
	vim.b.copilot_suggestion_hidden = false
end)
