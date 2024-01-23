return {
	"stevearc/conform.nvim",
	optional = true,
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
