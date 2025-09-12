return {
	{
		"mfussenegger/nvim-lint",
		event = "BufEnter",
		config = function()
			-- override diagnostic signs using the new API
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
			})

			-- custom linter definition for staticcheck
			require("lint").linters.staticcheck = {
				cmd = "staticcheck",
				stdin = false,
				append_fname = true,
				args = { "--checks", "all" },
				stream = "stdout",
				ignore_exitcode = true,
				parser = function(output, bufnr)
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

			-- filetype to linter mapping
			require("lint").linters_by_ft = {
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				html = { "djlint" },
				javascript = { "jshint" },
				jinja = { "markdownlint", "codespell" },
				jinja2 = { "markdownlint", "codespell" },
				json = { "jsonlint" },
				markdown = { "markdownlint", "codespell" },
				python = { "ruff", "pydocstyle" },
				sql = { "sqlfluff" },
				yaml = { "actionlint", "yamllint" },
			}

			-- auto-run linting on buffer events
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
