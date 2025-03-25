return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")

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
			local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- Flags
			local lsp_flags = {
				debounce_text_changes = 150,
			}

			-- Servers
			local servers = {
				-- bashls = {},
				-- dockerls = {},
				-- emmet_language_server = {},
				-- gopls = {},
				html = {},
				-- jsonls = {},
				ltex = {
					-- 	filetypes = { "markdown" },
					-- 	settings = { ltex = { enabled = { "markdown" }, language = { "en-NZ" } } },
				},
				-- lua_ls = {
				-- 	cmd = { "lua-language-server", "--force-accept-workspace" },
				-- 	settings = {
				-- 		Lua = {
				-- 			runtime = { version = "LuaJIT" },
				-- 			diagnostics = { globals = { "vim" } },
				-- 			workspace = { library = ".", checkThirdParty = false },
				-- 			telemetry = { enable = false },
				-- 		},
				-- 	},
				-- },
				marksman = {},
				prosemd_lsp = {},
				pyright = { cmd = { "pyright-langserver", "--stdio" } },
				ruff = {
					cmd = { "/Users/adamgreen/.venv/bin/ruff", "server" },
					filetypes = { "python" },
					-- root_dir = require("lspconfig").util.root_pattern(
					-- 	".git",
					-- 	"pyproject.toml",
					-- 	"setup.py",
					-- 	"setup.cfg",
					-- 	"requirements.txt"
					-- ),
					single_file_support = true,
				},
				-- rust_analyzer = { settings = { ["rust-analyzer"] = {} } },
				-- tailwindcss = { cmd = { "tailwindcss-language-server", "--stdio" } },
				-- ts_ls = {},
			}
			for server, config in pairs(servers) do
				require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
					on_attach = on_attach,
					capabilities = capabilities,
					flags = lsp_flags,
				}, config))
			end
		end,
	},
}
