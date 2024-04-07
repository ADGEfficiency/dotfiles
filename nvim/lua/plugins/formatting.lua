return {
	{

		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				notify_on_error = false,
				format_on_save = {
					timeout_ms = 4000,
					lsp_fallback = true,
				},

				formatters_by_ft = {
					bash = { "beautysh", "shellharden" },
					sh = { "beautysh", "shellharden" },
					html = { "djlintJinja", "prettier" },
					jinja = { "djlintJinja" },
					json = { "jq" },
					lua = { "stylua" },
					go = { "gofmt" },
					-- markdown = { "mdformat" },
					python = {
						-- "isort",
						"ruff_format",
						"ruff_fix",
					},
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
		end,
	},
}
