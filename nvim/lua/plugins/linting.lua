return {
	{

		"mfussenegger/nvim-lint",
		event = "BufEnter",
		config = function()
			require("lint").linters_by_ft = {
				json = { "jsonlint" },
				html = { "djlint" },
				dockerfile = { "hadolint" },
				markdown = { "markdownlint", "codespell" },
				jinja = { "markdownlint", "codespell" },
				jinja2 = { "markdownlint", "codespell" },
				yaml = { "actionlint", "yamllint" },
				python = { "ruff", "mypy", "flake8", "pydocstyle", "pylint" },
				javascript = { "jshint" },
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
