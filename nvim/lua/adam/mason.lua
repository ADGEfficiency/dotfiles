local lspconfig = require("lspconfig")

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "emmet_language_server",
    "pyright",
    "tailwindcss",
    "ruff_lsp",
    "bashls",
    "prosemd_lsp"
  },
  automatic_installation = true,
})

require("mason-lspconfig").setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})
