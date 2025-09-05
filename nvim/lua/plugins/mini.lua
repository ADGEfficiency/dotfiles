return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- text editing
			require("mini.comment").setup()
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.trailspace").setup()
			
			-- enhanced text objects
			require("mini.ai").setup({
				custom_textobjects = {
					-- Python text objects
					f = require('mini.ai').gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
					c = require('mini.ai').gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
					-- Markdown text objects
					h = require('mini.ai').gen_spec.treesitter({ a = '@markup.heading', i = '@markup.heading' }),
					-- Code blocks in markdown
					C = function(ai_type)
						local pattern = '```.-```'
						return require('mini.ai').gen_spec.pair(pattern, pattern, {
							type = 'non-balanced'
						})(ai_type)
					end,
				},
			})

			-- visual
			require("mini.hipatterns").setup({
				highlighters = {
					todo = { pattern = "TODO", group = "DiagnosticInfo" },
					hack = { pattern = "HACK", group = "DiagnosticInfo" },
					warn = { pattern = "WARN", group = "DiagnosticInfo" },
					perf = { pattern = "PERF", group = "DiagnosticInfo" },
					note = { pattern = "NOTE", group = "DiagnosticInfo" },
					test = { pattern = "TEST", group = "DiagnosticInfo" },
					fix = { pattern = "FIX", group = "DiagnosticInfo" },
					fixme = { pattern = "FIXME", group = "DiagnosticInfo" },
				},
			})
		end,
	},
}
