return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		dependencies = {
			{
				-- next edit suggestions; used as a library by copilot.lua, not as its own LSP
				"copilotlsp-nvim/copilot-lsp",
				init = function()
					vim.g.copilot_nes_debounce = 150
					-- first <tab> jumps to the edit, second applies it and jumps to its end;
					-- terminals send the same byte for <tab> and <c-i>, so fall back to the jumplist
					vim.keymap.set("n", "<tab>", function()
						if not vim.b[vim.api.nvim_get_current_buf()].nes_state then
							return "<C-i>"
						end
						local nes = require("copilot-lsp.nes")
						local _ = nes.walk_cursor_start_edit()
							or (nes.apply_pending_nes() and nes.walk_cursor_end_edit())
						return nil
					end, { expr = true, desc = "Copilot NES: go to / accept suggestion" })

					-- the plugin only clears a suggestion when its line leaves the buffer, so a
					-- suggestion you typed yourself stays on screen; clear it once the buffer
					-- already holds the suggested text, so untyped suggestions survive an edit
					local function nes_already_typed(state)
						local text = state.newText or state.text
						if text == "" then
							return true -- a deletion cannot be verified; treat any edit as stale
						end
						local start = state.range.start
						local lines = vim.split(text, "\n", { plain = true })
						local last = #lines
						local end_row = start.line + last - 1
						local end_col = #lines[last] + (last == 1 and start.character or 0)
						local ok, got =
							pcall(vim.api.nvim_buf_get_text, 0, start.line, start.character, end_row, end_col, {})
						return ok and table.concat(got, "\n") == text
					end

					vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
						callback = function()
							local state = vim.b.nes_state
							if state and nes_already_typed(state) then
								require("copilot-lsp.nes").clear()
							end
						end,
						desc = "Copilot NES: clear suggestion once typed",
					})
				end,
			},
		},
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			nes = {
				enabled = true,
				-- keymaps handled above in copilot-lsp's init
				keymap = {
					accept_and_goto = false,
					accept = false,
					dismiss = false,
				},
			},
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
		-- blink.cmp maps <Tab> buffer-locally and wins over CopilotChat's <Tab>
		-- completion; opt out of blink here so resource completion (#file:, #buffer:) works
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "copilot-chat",
				callback = function()
					vim.b.completion = false
				end,
			})
		end,
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
			-- model = "claude-sonnet-4.6",
			trusted_tools = { "file", "glob", "grep", "buffer", "gitdiff", "selection" },
			auto_fold = false,
			auto_insert_mode = true,
			auto_follow_cursor = false,
			history_path = vim.fn.stdpath("data") .. "/copilotchat_history",
		},
	},
}
