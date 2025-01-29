return {
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		-- event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"onsails/lspkind.nvim",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-cmdline",
				"dmitmel/cmp-cmdline-history",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		config = function()
			vim.lsp.set_log_level("off")

			local lspconfig = require("lspconfig")
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"tailwindcss",
					"bashls",
					"prosemd_lsp",
					"marksman",
					"lua_ls",
					"html",
					"docker_compose_language_service",
					-- "ruff",
					"bashls",
					"dockerls",
					"jsonls",
					"prosemd_lsp",
					-- "rnix",
					-- "tsserver",
					"emmet_language_server",
					"pyright",
					"rust_analyzer",
					"jedi_language_server",
					-- "sqlls",
				},
				automatic_installation = true,
			})

			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({})
				end,
			})

			-- -- cmp commandline
			-- local cmp = require("cmp")
			-- local lspkind = require("lspkind")
			-- cmp.setup.cmdline(":", {
			-- 	sources = {
			-- 		{ name = "cmdline", max_item_count = 3 },
			-- 		{ name = "cmdline_history", max_item_count = 5 },
			-- 		{ name = "buffer", max_item_count = 3 },
			-- 	},
			-- 	-- Enable pictogram icons for lsp/autocompletion
			-- 	formatting = {
			-- 		expandable_indicator = true,
			-- 		format = lspkind.cmp_format({
			-- 			mode = "symbol_text",
			-- 			maxwidth = 50,
			-- 			ellipsis_char = "...",
			-- 			menu = {
			-- 				cmdline_history = "[Hist]",
			-- 				cmdline = "[CmdL]",
			-- 				buffer = "[Buff]",
			-- 			},
			-- 		}),
			-- 	},
			-- })
			-- -- `/` cmdline setup.
			-- cmp.setup.cmdline("/", {
			-- 	mapping = cmp.mapping.preset.cmdline(),
			-- 	sources = {
			-- 		{ name = "buffer" },
			-- 	},
			-- })

			-- Diagnostic Appearance
			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
					width = 160,
					max_height = 10,
					format = function(diagnostic)
						return string.format("%s", diagnostic.message)
					end,
				},
			})

			-- Key Mappings

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

			-- Language Server Configs

			-- On Attach
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- map the following keys after the language server attaches to the current buffer
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "grr", vim.lsp.buf.rename, bufopts)
			end

			-- Capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Handlers
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
				height = 32,
				width = 80,
				focusable = true,
				close_events = { "InsertEnter", "FocusLost" },
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			})

			-- Flags
			local lsp_flags = {
				debounce_text_changes = 150,
			}

			-- Servers
			local servers = {
				bashls = {},
				dockerls = {},
				jsonls = {},
				prosemd_lsp = {},
				ltex = {
					filetypes = { "markdown" },
					settings = {
						ltex = {
							enabled = { "markdown" },
							language = { "en-NZ" },
						},
					},
				},
				emmet_language_server = {},
				jedi_language_server = {},
				html = {},
				gopls = {},
				lua_ls = {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
				marksman = {
					filetypes = { "markdown" },
				},
				-- rnix = {},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {},
					},
				},
				pyright = {
					cmd = { "pyright-langserver", "--stdio" },
				},
				tsserver = {},
				tailwindcss = {
					cmd = { "tailwindcss-language-server", "--stdio" },
				},
				-- sqlls = {
				-- 	root_dir = function(fname)
				-- 		return vim.loop.cwd()
				-- 	end,
				-- },
			}
			for server, config in pairs(servers) do
				require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
					on_attach = on_attach,
					capabilities = capabilities,
					flags = lsp_flags,
				}, config))
			end

			-- Set an autocommand to open diagnostic float on hover
			local debounce_timer = nil
			vim.api.nvim_create_autocmd("CursorHold", {
				pattern = "*",
				callback = function()
					if debounce_timer then
						vim.fn.timer_stop(debounce_timer)
					end

					debounce_timer = vim.fn.timer_start(2000, function()
						local opts = { focusable = false, scope = "cursor" }
						vim.diagnostic.open_float(nil, opts)
					end)
				end,
			})
		end,
	},
}
