return {
	"stevearc/conform.nvim",
	optional = true,
	-- If this is set, Conform will run the formatter on save.
	-- It will pass the table to conform.format().
	-- This can also be a function that returns the table.
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},
	-- If this is set, Conform will run the formatter asynchronously after save.
	-- It will pass the table to conform.format().
	-- This can also be a function that returns the table.
	format_after_save = {
		lsp_fallback = true,
	},
	-- Conform will notify you when a formatter errors
	notify_on_error = true,
	opts = {
		formatters_by_ft = {
			["markdown"] = { { "prettierd", "prettier" } },
			["markdown.mdx"] = { { "prettierd", "prettier" } },
			["javascript"] = { "dprint" },
			["javascriptreact"] = { "dprint" },
			["typescript"] = { "dprint" },
			["typescriptreact"] = { "dprint" },
			bash = { "beautysh", "shellharden" },
			sh = { "beautysh", "shellharden" },
			html = { "djlintJinja", "prettier" },
			jinja = { "djlintJinja" },
			json = { "jq" },
			lua = { "stylua" },
			go = { "gofmt" },
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
		formatters = {
			djlintJinja = {
				command = "djlint",
				args = {
					"--reformat",
					"--profile",
					"jinja",
					"-",
				},
			},
			beautysh = {
				command = "beautysh",
				args = {
					"--indent-size",
					"2",
					"-",
				},
			},
		},
	},
}
