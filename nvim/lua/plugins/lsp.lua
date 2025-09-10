return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- global diagnostic keymaps
			-- TODO - should these be elsewhere?
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

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

			-- basedpyright
			vim.lsp.config["basedpyright"] = {
				cmd = { "basedpyright-langserver", "--stdio" },
				filetypes = { "python" },
				root_markers = { ".git", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
				settings = {
					basedpyright = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
						},
					},
				},
			}
			vim.lsp.enable("basedpyright")

			-- lua
			vim.lsp.config["luals"] = {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = { globals = { "vim" } },
					},
				},
			}
			vim.lsp.enable("luals")

			-- ruff
			vim.lsp.config["ruff"] = {
				cmd = { "ruff", "server" },
				filetypes = { "python" },
				single_file_support = true,
				root_markers = {
					"pyproject.toml",
					"ruff.toml",
					".ruff.toml",
					".git",
				},
			}
			vim.lsp.enable("ruff")

			-- gopls
			vim.lsp.config["gopls"] = {
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_markers = { "go.work", "go.mod", ".git" },
			}
			vim.lsp.enable("gopls")

			-- html
			vim.lsp.config["html"] = {
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html" },
				root_markers = { "package.json", ".git" },
				single_file_support = true,
			}
			vim.lsp.enable("html")

			-- LSP keymaps and features on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
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
				end,
			})
		end,
	},
}
