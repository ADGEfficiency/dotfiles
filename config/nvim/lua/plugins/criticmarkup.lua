-- CriticMarkup annotations for prose review:
--   {++added++}  {--deleted--}  {~~old~>new~~}  {>>comment<<}  {==highlight==}
--
-- No keymaps. Write annotations with the `critic-*` snippets in snippets/markdown.json,
-- and resolve them with `:Critic accept` / `:Critic reject` on the cursor annotation.
--
-- The upstream plugin is deliberately neutered — we clear its augroup, which is the
-- only thing that sources its autoload file. That file is broken for this config:
--   * it declares <localleader>e{a,d,h,c,s} as `<buffer>` maps at top level, so they
--     bind to whichever buffer is current when it loads and never apply again
--   * it declares ]m / [m as global `nmap`, clobbering the built-in method motions
--     in every filetype
--   * its Accept()/Reject() detect the annotation kind with synID(), which returns 0
--     because treesitter.lua sets additional_vim_regex_highlighting = false
--     (ie syntax=off) — so its own :Critic silently does nothing
--
-- Highlighting uses matchadd() for the same syntax=off reason: the plugin's
-- `syn region` definitions never render. Match highlighting combines over
-- treesitter's extmarks, so it shows without touching the treesitter config.

local filetypes = { "markdown", "pandoc", "text" }

-- Lua patterns and the resolvers that turn captures into replacement text.
-- Substitution captures old and new; the rest capture a single body.
local annotations = {
	{
		pattern = "%{%+%+(.-)%+%+%}",
		group = "CriticAddition",
		accept = function(text)
			return text
		end,
		reject = function()
			return ""
		end,
	},
	{
		pattern = "%{%-%-(.-)%-%-%}",
		group = "CriticDeletion",
		accept = function()
			return ""
		end,
		reject = function(text)
			return text
		end,
	},
	{
		pattern = "%{~~(.-)~>(.-)~~%}",
		group = "CriticSubstitution",
		accept = function(_, new)
			return new
		end,
		reject = function(old)
			return old
		end,
	},
	{
		pattern = "%{==(.-)==%}",
		group = "CriticHighlight",
		accept = function(text)
			return text
		end,
		reject = function(text)
			return text
		end,
	},
	{
		pattern = "%{>>(.-)<<%}",
		group = "CriticComment",
		accept = function()
			return ""
		end,
		reject = function()
			return ""
		end,
	},
}

-- Very-nomagic vim regexes for matchadd().
local match_patterns = {
	CriticAddition = [[\V{++\_.\{-}++}]],
	CriticDeletion = [[\V{--\_.\{-}--}]],
	CriticSubstitution = [[\V{~~\_.\{-}~~}]],
	CriticHighlight = [[\V{==\_.\{-}==}]],
	CriticComment = [[\V{>>\_.\{-}<<}]],
}

local highlight_links = {
	CriticAddition = "DiffAdd",
	CriticDeletion = "DiffDelete",
	CriticSubstitution = "DiffChange",
	CriticHighlight = "Search",
	CriticComment = "Comment",
}

local function set_highlights()
	for group, link in pairs(highlight_links) do
		vim.api.nvim_set_hl(0, group, { link = link, default = true })
	end
end

--- Byte offset of the cursor in the current buffer, 0-indexed.
local function cursor_offset()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	return vim.api.nvim_buf_get_offset(0, row - 1) + col
end

--- Convert a 0-indexed byte offset to a (row, col) pair for nvim_buf_set_text.
local function offset_to_position(offset)
	local row = vim.fn.byte2line(offset + 1) - 1
	return row, offset - vim.api.nvim_buf_get_offset(0, row)
end

--- Innermost annotation containing the cursor, or nil.
local function find_annotation()
	local text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
	local offset = cursor_offset()
	local found = nil

	for _, annotation in ipairs(annotations) do
		local from = 1
		while true do
			local start, finish, first, second = text:find(annotation.pattern, from)
			if not start then
				break
			end
			-- find() is 1-indexed and inclusive; offset is 0-indexed
			local inside = offset >= start - 1 and offset < finish
			if inside and (not found or start - 1 > found.start) then
				found = {
					annotation = annotation,
					start = start - 1,
					finish = finish,
					captures = { first, second },
				}
			end
			from = start + 1
		end
	end

	return found
end

local function resolve(action)
	if action ~= "accept" and action ~= "reject" then
		vim.notify("Critic takes 'accept' or 'reject', got " .. vim.inspect(action), vim.log.levels.ERROR)
		return
	end

	local found = find_annotation()
	if not found then
		vim.notify("No CriticMarkup annotation under cursor", vim.log.levels.WARN)
		return
	end

	local replacement = found.annotation[action](unpack(found.captures))
	local start_row, start_col = offset_to_position(found.start)
	local end_row, end_col = offset_to_position(found.finish)
	vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, vim.split(replacement, "\n"))
end

local function attach_matches()
	if not vim.tbl_contains(filetypes, vim.bo.filetype) or vim.w.criticmarkup_matches then
		return
	end
	for group, pattern in pairs(match_patterns) do
		vim.fn.matchadd(group, pattern, 20)
	end
	vim.w.criticmarkup_matches = true
end

local function attach_command(buffer)
	vim.api.nvim_buf_create_user_command(buffer, "Critic", function(args)
		resolve(args.args)
	end, {
		nargs = 1,
		complete = function()
			return { "accept", "reject" }
		end,
		desc = "Accept or reject the CriticMarkup annotation under the cursor",
	})
end

return {
	"vim-pandoc/vim-criticmarkup",
	ft = filetypes,
	config = function()
		-- Clearing the plugin's own augroup stops it ever sourcing its autoload file,
		-- so none of its mappings or syntax regions are installed.
		pcall(vim.api.nvim_del_augroup_by_name, "criticmarkup")

		set_highlights()

		local group = vim.api.nvim_create_augroup("criticmarkup_config", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = set_highlights })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			pattern = filetypes,
			callback = function(args)
				attach_command(args.buf)
			end,
		})
		-- matchadd() is window-local, so re-apply whenever a buffer lands in a window.
		vim.api.nvim_create_autocmd({ "BufWinEnter", "WinNew" }, { group = group, callback = attach_matches })

		-- The ft trigger means FileType and BufWinEnter already fired for this buffer.
		attach_command(0)
		attach_matches()
	end,
}
