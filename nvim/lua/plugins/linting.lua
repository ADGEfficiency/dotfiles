return {
	{

		"mfussenegger/nvim-lint",
		event = "BufEnter",
		config = function()
			require("lint").linters.staticcheck = {
				cmd = "staticcheck", -- Command to run staticcheck
				stdin = false, -- staticcheck does not support stdin; it requires a file path
				append_fname = true, -- Append the filename to the args
				args = { "--checks", "all" },
				stream = "stdout", -- staticcheck writes its output to stdout
				ignore_exitcode = true, -- staticcheck may exit with non-zero on lint warnings/errors
				parser = function(output, bufnr) -- Define a parser function for the linter output
					local diagnostics = {}
					local s_pattern = "^(.+):(%d+):(%d+):%s+(.*)$"
					for _, line in ipairs(vim.split(output, "\n")) do
						local file, lnum, col, msg = line:match(s_pattern)
						if file and lnum and msg then
							table.insert(diagnostics, {
								bufnr = bufnr,
								lnum = tonumber(lnum) - 1,
								col = tonumber(col) - 1,
								severity = vim.diagnostic.severity.ERROR,
								message = msg,
							})
						end
					end
					return diagnostics
				end,
			}

			require("lint").linters_by_ft = {
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				html = { "djlint" },
				javascript = { "jshint" },
				jinja = { "markdownlint", "codespell" },
				jinja2 = { "markdownlint", "codespell" },
				json = { "jsonlint" },
				markdown = { "markdownlint", "codespell" },
				python = { "ruff" },
				sql = { "sqlfluff" },
				yaml = {
					-- "actionlint",
					"yamllint",
				},
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
