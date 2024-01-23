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
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
