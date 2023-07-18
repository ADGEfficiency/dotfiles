local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  debug = true,
  sources = {
    -- diagnostics.flake8,
    diagnostics.ruff,
    -- diagnostics.actionlint,
    -- diagnostics.alex,
    diagnostics.checkmake,
    diagnostics.djlint,
    diagnostics.eslint,
    diagnostics.jsonlint,
    diagnostics.luacheck,
    -- diagnostics.shellcheck,
    diagnostics.hadolint,
    -- diagnostics.proselint.with({
    --   command = "/Users/adam/.pyenv/versions/general/bin/proselint",
    --   args = { "--json" },
    -- }),
    -- diagnostics.sqlfluff,
    -- code_actions.shellcheck,
    -- code_actions.xo,
    -- code_actions.proselint,
    -- formatting.black.with({ extra_args = { "--fast" } }),
    formatting.isort,
    -- formatting.isort,
    -- formatting.ruff,  cant get it to work
    -- formatting.stylua,
    -- formatting.beautysh,
    -- formatting.shellharden,
    formatting.cbfmt,
    formatting.djlint.with({ extra_args = { "--profile=jinja" } }),
    -- formatting.tidy,
    -- formatting.jq,
    -- formatting.prettier.with({ extra_args = { "--no-prose-wrap" } }),
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
