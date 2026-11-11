return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		-- add or skip cursor above/below the main cursor
		set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end)
		set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end)
		set({ "n", "x" }, "<leader><up>", function() mc.lineSkipCursor(-1) end)
		set({ "n", "x" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

		-- add or skip a cursor by matching word/selection
		set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end)
		set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end)
		set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end)
		set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end)

		-- disable and enable cursors
		set({ "n", "x" }, "<c-q>", mc.toggleCursor)

		-- these mappings only apply while multiple cursors exist
		mc.addKeymapLayer(function(layerSet)
			-- select a different cursor as the main one
			layerSet({ "n", "x" }, "<left>", mc.prevCursor)
			layerSet({ "n", "x" }, "<right>", mc.nextCursor)

			-- delete the main cursor
			layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

			-- esc clears cursors (or re-enables them if disabled)
			layerSet("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)

		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { reverse = true })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { reverse = true })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}
