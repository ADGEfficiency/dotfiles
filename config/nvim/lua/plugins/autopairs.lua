return {
	{

		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
		config = function()
			-- Setup nvim-cmp.
			local status_ok, npairs = pcall(require, "nvim-autopairs")
			if not status_ok then
				return
			end

			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			})

			local Rule = require("nvim-autopairs.rule")
			local rules = { Rule("/*", "*/", "sql") }

			-- CriticMarkup: typing `{++` leaves the cursor inside `{++|++}`. blink can't
			-- complete these as snippets because its keyword scanner treats `{` and `+`
			-- as non-keyword, so the prefix reads as an empty string.
			for _, marker in ipairs({
				{ "{++", "++}" },
				{ "{--", "--}" },
				{ "{==", "==}" },
				{ "{>>", "<<}" },
				{ "{~~", "~>~~}" },
			}) do
				local open, close = marker[1], marker[2]
				table.insert(
					rules,
					Rule(open, close, { "markdown", "pandoc", "text" }):replace_endpair(function(opts)
						-- the default { } rule has usually already inserted the closing
						-- brace; it is absent when the next char suppressed pairing
						return vim.startswith(opts.next_char or "", "}") and close:sub(1, -2) or close
					end)
				)
			end

			npairs.add_rules(rules)

			-- Integration with blink.cmp is handled automatically
		end,
	},
}
