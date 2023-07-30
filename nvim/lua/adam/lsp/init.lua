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
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

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
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Language Server Configs

local lsp_flags = {
  debounce_text_changes = 150,
}

require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig")["bashls"].setup({ on_attach = on_attach, flags = lsp_flags })
require("lspconfig")["dockerls"].setup({ on_attach = on_attach, flags = lsp_flags })
require("lspconfig")["jsonls"].setup({ on_attach = on_attach, flags = lsp_flags })
require("lspconfig")["prosemd_lsp"].setup({ on_attach = on_attach, flags = lsp_flags })
require("lspconfig")["rnix"].setup({ on_attach = on_attach, flags = lsp_flags })
require("lspconfig")["tsserver"].setup({ on_attach = on_attach, flags = lsp_flags })
require("lspconfig")["html"].setup({ on_attach = on_attach, flags = lsp_flags })
require("lspconfig")["emmet_language_server"].setup({ on_attach = on_attach, flags = lsp_flags })

require("lspconfig")["pyright"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = { "pyright-langserver", "--stdio" },
})

require("lspconfig")["tailwindcss"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = {
    "jinja.html",
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
})

require("lspconfig")["marksman"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  filetypes = { "markdown" },
})

require("lspconfig")["rust_analyzer"].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    ["rust-analyzer"] = {},
  },
})

require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
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

local on_attach_efm = function(client)
  vim.cmd([[augroup lsp_formatting]])
  vim.cmd([[autocmd!]])
  vim.cmd([[autocmd BufWritePre <buffer> :lua vim.lsp.buf.format()]])
  vim.cmd([[augroup END]])
  vim.cmd("command! LspFormat lua vim.lsp.buf.format()")
end

require("lspconfig")["efm"].setup({
  on_attach = on_attach_efm,
  flags = lsp_flags,
  cmd = { "efm-langserver", "-logfile", "/tmp/efm.log", "-loglevel", "1" },
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      markdown = {
        {
          lintCommand = "markdownlint -s",
          lintStdin = true,
          lintFormats = {
            "%f:%l %m",
            "%f:%l:%c %m",
            "%f: %l: %m",
          },
        },
      },
      html = {
        {
          lintCommand = "djlint --quiet -",
          lintStdin = true,
        },
        {
          formatCommand = "djlint --reformat -",
          formatStdin = true,
        },
      },
      json = {
        {
          lintCommand = "jsonlint --compact",
          lintStdin = true,
          lintFormats = { "line %l, col %c, found: %m" },
        },
        {
          formatCommand = "prettier --parser json --config ~/dotfiles/.prettierrc",
        },
      },
      shell = {
        {
          lintCommand = "shellcheck --color=never --format=gcc -",
          lintStdin = true,
          lintFormats = { "-:%l:%c: %trror: %m", "-:%l:%c: %tarning: %m", "-:%l:%c: %tote: %m" },
        },
      },
      docker = {
        {
          lintCommand = "hadolint --no-color -",
          lintStdin = true,
          lintFormats = { "%f:%l %m" },
        },
      },
      lua = {
        {
          lintCommand = "luacheck --codes --no-color --quiet -",
          lintStdin = true,
          lintFormats = { "%.%#:%l:%c: (%t%n) %m" },
        },
        {
          formatCommand = "stylua --color Never -",
          formatStdin = true,
        },
      },
      make = {
        {
          lintCommand = "checkmake --format='{{.LineNumber}}: {{.Violation}}\n' ${INPUT}",
          lintStdin = false,
          lintFormats = { "%l: %m" },
        },
      },
      python = {
        {
          lintCommand =
          "/Users/adam/.pyenv/versions/3.10.6/envs/general/bin/ruff check -q -n -e --stdin-filename ${INPUT} -",
          lintStdin = true,
          lintFormats = { "%f:%l:%c: %m" },
          lintIgnoreExitCode = true,
        },
        {
          formatCommand = "/Users/adam/.pyenv/versions/3.10.6/envs/general/bin/isort --stdout --profile=black -",
          formatStdin = true,
        },
        {
          formatCommand = "/Users/adam/.pyenv/versions/3.10.6/envs/general/bin/black --no-color -q -",
          formatStdin = true,
        },
      },
    },
  },
})
