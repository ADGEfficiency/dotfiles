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
