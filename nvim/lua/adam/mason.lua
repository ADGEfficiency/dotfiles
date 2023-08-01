local lspconfig = require("lspconfig")

require("mason").setup({})
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
    "tailwindcss",
    "rust_analyzer"
  },
  automatic_installation = true,
})

require("mason-lspconfig").setup_handlers({
  function(server)
    lspconfig[server].setup({})
  end,
})
