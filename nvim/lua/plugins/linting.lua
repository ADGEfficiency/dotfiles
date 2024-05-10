return {
	{

		"mfussenegger/nvim-lint",
		event = "BufEnter",
		config = function()
			require("lint").linters_by_ft = {
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				html = { "djlint" },
				javascript = { "jshint" },
				jinja = { "markdownlint", "codespell" },
				jinja2 = { "markdownlint", "codespell" },
				json = { "jsonlint" },
				markdown = { "markdownlint", "codespell" },
				python = { "ruff", "mypy", "flake8", "pydocstyle", "pylint" },
				sql = { "sqlfluff" },
				yaml = { "actionlint", "yamllint" },
			}

			require("lint").linters.staticcheck = {
				cmd = "staticcheck", -- Command to run staticcheck
				stdin = false, -- staticcheck does not support stdin; it requires a file path
				append_fname = true, -- Append the filename to the args
				stream = "stdout", -- staticcheck writes its output to stdout
				ignore_exitcode = true, -- staticcheck may exit with non-zero on lint warnings/errors
			}

			vim.api.nvim_create_autocmd({
				"BufWritePost",
				"BufReadPost",
				"BufEnter",
				"VimEnter",
			}, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
