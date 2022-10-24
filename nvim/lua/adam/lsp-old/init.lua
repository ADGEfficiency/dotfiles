local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("adam.lsp.lsp-installer")
require("adam.lsp.null-ls")
require("adam.lsp.handlers").setup()

lspconfig.html.setup {}

vim.diagnostic.config({
  virtual_text = false
})

local util = require 'vim.lsp.util'

local formatting_callback = function(client, bufnr)
  vim.keymap.set('n', '<leader>f', function()
    local params = util.make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr)
  end, {buffer = bufnr})
end

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    formatting_callback(client, bufnr)
    common_on_attach(client, bufnr)
  end
}

lspconfig.ccls.setup {
  on_attach = function(client, bufnr)
    common_on_attach(client, bufnr)
  end
}
