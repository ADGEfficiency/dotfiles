return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			-- TODO
			-- nes = {
			-- 	enabled = true,
			-- 	keymap = {
			-- 		accept_and_goto = "<leader>ng",
			-- 		accept = "<leader>ne",
			-- 		dismiss = "<leader>nd",
			-- 	},
			-- },
			filetypes = {
				["*"] = true,
				cvs = false,
				gitcommit = false,
				gitrebase = false,
				help = true,
				hgcommit = false,
				lua = true,
				markdown = true,
				python = true,
				svn = false,
				yaml = true,
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			system_prompt = [[You are an expert software engineer and data scientist.
- Provide clear, concise explanations - favour less verbose implementations
- Do not include summaries unless explicitly requested
- Favour the simplest solution that could work
- Follow patterns and conventions already established in the codebase
- Push back and offer alternatives when meaningful tradeoffs exist
- Ask a clarifying question rather than guessing when requirements are unclear
- Before substantial changes, propose a concise plan and resolve open decisions
- Include comments only when they explain something non-obvious
- Include docstrings for all public functions
- Delete dead code immediately
- Favour flat, unnested code - minimize levels of indentation
- Fail at the source of the error rather than checking and failing
- All Python code must pass strict type checking (basedpyright): use modern type hints (list, dict, tuple), never typing.List / typing.Dict
- Use dataclasses or pydantic for data objects, and context managers for resources
- Do not use `_df` suffixes for dataframes; prefer `data`
- Only deploy Databricks Asset Bundles to the `dev_developer` target
- List tradeoffs, assumptions, and uncertainties explicitly when relevant
- Prefer small, targeted edits over large rewrites
- Produce directly usable code because responses may be copied into the codebase]],
			model = "claude-sonnet-4.6",
			sticky = "@copilot",
			trusted_tools = { "file", "glob", "grep", "buffer", "gitdiff", "selection" },
			auto_fold = false,
			auto_insert_mode = true,
			insert_at_end = true,
			auto_follow_cursor = false,
			history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
		},
	},
}
