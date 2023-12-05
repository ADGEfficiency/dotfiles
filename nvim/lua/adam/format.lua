require("conform").setup({
	formatters_by_ft = {
		bash = { "beautysh", "shellharden" },
		sh = { "beautysh", "shellharden" },
		html = { "djlintJinja", "prettier" },
		jinja = { "djlintJinja" },
		json = { "prettier" },
		lua = { "stylua" },
    go = {"gofmt"},
		-- markdown = { "mdformat" },
		python = { "isort", "ruff_format", "ruff_lint" },
		javascript = { "prettier" },
		css = { "stylelint" },
		yaml = { "yamlfix" },
		sql = { "sql_formatter" },
		["*"] = {
			"codespell",
			"trim_newlines",
			-- "trim_whitespace"
		},
	},
})

-- setup format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			quiet = false,
			lsp_fallback = false,
			timeout_ms = 2000,
		})
	end,
})

require("conform").formatters.djlintJinja = {
	command = "djlint",
	args = {
		"--reformat",
		"--profile",
		"jinja",
		"-",
	},
}

require("conform").formatters.beautysh = {
	command = "beautysh",
	args = {
		"--indent-size",
		"2",
		"-",
	},
}
