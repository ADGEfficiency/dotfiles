return {
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-cmdline" },
		},
		config = function()
			-- Language Server Protocol (LSP) Settings
			--
			-- Turn off logging by default for LSP
			vim.lsp.set_log_level("off")
			-- You can turn logging on with 'vim.lsp.set_log_level("debug")'
			-- mason setup
			local lspconfig = require("lspconfig")

			require("mason").setup()
			require("mason-lspconfig").setup({
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
			})

			require("mason-lspconfig").setup_handlers({
				function(server)
					lspconfig[server].setup({})
				end,
			})
			-- Key Mappings

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

			-- map the following keys after the language server attaches to the current buffer
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
					height = 16,
					width = 80,
					max_height = 32,
				},
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
				height = 32,
				width = 80,
				focusable = true,
			})

			-- Language Server Configs

			local lsp_flags = {
				debounce_text_changes = 150,
			}

			require("lspconfig")["bashls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["sqlls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
				root_dir = function(fname)
					return vim.loop.cwd()
				end,
			})

			require("lspconfig")["dockerls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["jsonls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["prosemd_lsp"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["rnix"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["tsserver"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["html"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["emmet_language_server"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig").pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
				cmd = { "pyright-langserver", "--stdio" },
			})

			require("lspconfig")["jedi_language_server"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})

			require("lspconfig")["tailwindcss"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
				cmd = { "tailwindcss-language-server", "--stdio" },
			})

			require("lspconfig")["marksman"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
				filetypes = { "markdown" },
			})

			require("lspconfig")["rust_analyzer"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
				settings = {
					["rust-analyzer"] = {},
				},
			})

			require("lspconfig")["lua_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
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
			})
			local cmp = require("cmp")

			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			local cmp_status_ok, signature = pcall(require, "lsp_signature")
			if not cmp_status_ok then
				return
			end

			signature.setup({
				debug = false, -- set to true to enable debug logging
				log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
				-- default is  ~/.cache/nvim/lsp_signature.log
				verbose = false, -- show debug line number

				bind = true, -- This is mandatory, otherwise border config won't get registered.
				-- If you want to hook lspsaga or other signature handler, pls set to false
				doc_lines = 10,

				floating_window = true,

				floating_window_above_cur_line = false, -- try to place the floating above the current line when possible Note:
				-- will set to true when fully tested, set to false will use whichever side has more space
				-- this setting will be helpful if you do not want the PUM and floating win overlap

				floating_window_off_x = 0, -- adjust float windows x position.
				floating_window_off_y = -2, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

				fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
				hint_enable = false, -- virtual hint enable
				hint_scheme = "String",
				hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
				max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
				-- to view the hiding contents
				max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
				handler_opts = {
					border = "rounded", -- double, rounded, single, shadow, none
				},

				always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

				auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
				extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
				zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

				padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc

				transparency = nil, -- disabled by default, allow floating win transparent value 1~100
				shadow_blend = 36, -- if you using shadow as border use this set the opacity
				shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
				timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
				toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

				select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
			})
		end,
	},
}
