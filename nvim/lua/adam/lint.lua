require("lint").linters_by_ft = {
	json = { "jsonlint" },
	html = { "djlint" },
	docker = { "hadolint" },
	markdown = { "markdownlint", "codespell" },
	jinja = { "markdownlint", "codespell" },
	jinja2 = { "markdownlint", "codespell" },
	yaml = { "actionlint", "yamllint" },
	python = { "ruff", "mypy", "flake8", "pydocstyle", "pylint" },
	javascript = { "jshint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
