return {
	{

		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				notify_on_error = false,
				format_on_save = {
					timeout_ms = 20000,
					lsp_fallback = true,
				},

				formatters_by_ft = {
					bash = {
						"beautysh",
						"shellharden",
					},
					sh = { "beautysh", "shellharden" },
					html = { "djlintJinja", "prettier" },
					jinja = { "djlintJinja" },
					json = { "jq" },
					lua = { "stylua" },
					go = { "gofmt" },
					python = {
						"isort",
						"ruff_format",
						"trim_whitespace",
					},
					-- markdown = { "injected" },
					javascript = { "prettier" },
					css = { "stylelint" },
					yaml = { "yamlfix" },
					sql = { "sqlfluff" },
					["*"] = {
						"codespell",
						"trim_newlines",
					},
				},
			})

			require("conform").formatters.sqlfluff = {
				command = "sqlfluff",
				inherit = false,
				args = {
					"fix",
					"-t",
					"dbt",
					"$FILENAME",
				},
				stdin = false,
				require_cwd = true,
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

			require("conform").formatters.ruff_format = {
				command = "ruff",
				args = {
					"format",
					"--force-exclude",
					"--stdin-filename",
					"$FILENAME",
					"-",
				},
				range_args = function(_, ctx)
					return {
						"format",
						"--force-exclude",
						"--range",
						string.format(
							"%d:%d-%d:%d",
							ctx.range.start[1],
							ctx.range.start[2] + 1,
							ctx.range["end"][1],
							ctx.range["end"][2] + 1
						),
						"--stdin-filename",
						"$FILENAME",
						"-",
					}
				end,
				stdin = true,
				cwd = require("conform.util").root_file({
					"pyproject.toml",
					"ruff.toml",
					".ruff.toml",
				}),
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
						-- markdown = "md",
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
