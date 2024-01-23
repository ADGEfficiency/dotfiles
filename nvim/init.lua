-- Entrypoint
-- The order of the `require` below is important.
-- require("adam.options")
-- require("adam.plugins")
-- require("adam.color")
-- require("adam.alpha")
-- require("adam.cmp")
-- require("adam.gitsigns")
-- require("adam.lsp")
-- require("adam.format")
-- require("adam.lint")
-- require("adam.lualine")
-- require("adam.luasnip")
-- require("adam.pairs")
-- require("adam.telescope")
-- require("adam.treesitter")
-- require("adam.whichkey")
-- require("adam.barbar")
-- require("adam.copilot")
-- require("adam.signature")
-- require("adam.keys")

vim.lsp.set_log_level("debug")
-- require("adam.plugins")
require("config.lazy")
