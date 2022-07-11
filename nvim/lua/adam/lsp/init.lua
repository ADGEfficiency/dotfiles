local status_ok, cfg = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("adam.lsp.lsp-installer")
require("adam.lsp.null-ls")
require("adam.lsp.handlers").setup()

cfg.html.setup {}

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
