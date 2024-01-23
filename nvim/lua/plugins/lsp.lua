-- LSP configures the servers
-- Mason sets up the servers
return {
	{
		"williamboman/mason.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"hrsh7th/cmp-nvim-lsp",
				cond = function()
					return require("lazyvim.util").has("nvim-cmp")
				end,
			},
		},
		---@class PluginLspOpts
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
					-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					-- prefix = "icons",
				},
				severity_sort = true,
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"pyright",
				"tailwindcss",
				"ruff_lsp",
				"bashls",
				"prosemd_lsp",
				"marksman",
				"lua_ls",
				"html",
				"docker_compose_language_service",
				"ruff_lsp",
				"bashls",
				"dockerls",
				"jsonls",
				"prosemd_lsp",
				"rnix",
				"tsserver",
				"emmet_language_server",
				"pyright",
				"rust_analyzer",
				"jedi_language_server",
				"sqlls",
			},
			automatic_installation = true,
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
