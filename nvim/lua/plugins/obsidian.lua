return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/personal",
			},
		},
		ui = { enable = false },
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
			create_new = false,
		},
		legacy_commands = false,
		hl_groups = {
			-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
			ObsidianTodo = { fg = "NONE", bg = "NONE" },
		},
		note_frontmatter_func = function(note)
			local out = {
				id = note.id,
				created = os.date("%Y-%m-%d %H:%M:%S"),
				link = "",
				parent = "",
				tags = { "note" }, -- Add your default tags here
			}

			-- Add title as alias if it exists
			if note.title then
				note:add_alias(note.title)
				out.aliases = note.aliases
			end

			-- Preserve any existing metadata
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,
	},
}
