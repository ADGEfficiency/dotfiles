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
					python = { "isort", "ruff_format" },
					-- markdown = { "injected" },
					javascript = { "prettier" },
					css = { "stylelint" },
					yaml = { "yamlfix" },
					sql = {
						-- "sql_formatter",
						"sqlfluff",
						-- "sqlfmt",
					},
					["*"] = {
						-- "codespell",
						-- "trim_newlines",
						-- "injected",
						-- "trim_whitespace",
					},
				},
			})

			require("conform").formatters.sql_formatter = {
				command = "sql-formatter --dialect sqlite",
			}

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
			require("conform").formatters.injected = {
				options = {
					ignore_errors = false,
					lang_to_formatters = {
						json = { "jq" },
						python = { "black", "ruff_format" },
					},
					lang_to_ext = {
						bash = "sh",
						c_sharp = "cs",
						elixir = "exs",
						javascript = "js",
						julia = "jl",
						latex = "tex",
						markdown = "md",
						python = "py",
						ruby = "rb",
						rust = "rs",
						teal = "tl",
						typescript = "ts",
					},
				},
			}
		end,
	},
}
