-- Plugin Management

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Initialize Packer.nvim with a floating window display
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Plugin list
return packer.startup(function(use)
	-- Packer manages itself
	use({
		"wbthomason/packer.nvim",
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
	})

	-- Greeter
	use({ "goolord/alpha-nvim" })

	-- Colormaps
	use("sainnhe/everforest")
	use("dracula/vim")
	use("catppuccin/nvim")
	use("sam4llis/nvim-tundra")
	use("rebelot/kanagawa.nvim")
	use("folke/tokyonight.nvim")

	-- Copilot
	use({ "zbirenbaum/copilot.lua" })

	-- Completion with CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("dmitmel/cmp-cmdline-history")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-latex-symbols")
	use("uga-rosa/cmp-dictionary")
	use("David-Kunz/cmp-npm")
	use("hrsh7th/cmp-nvim-lsp")
	use("amarakon/nvim-cmp-buffer-lines")
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	-- Snippets
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Searching with Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "ptethng/telescope-makefile" })

	-- Searching with Grepper
	use({ "mhinz/vim-grepper" })

	-- Buffer and window management
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ "simeji/winresizer" })
	use({ "qpkorr/vim-bufkill" })

	-- Text editing - Python
	use("Vimjas/vim-python-pep8-indent")
	use({ "bps/vim-textobj-python" })

	--- Text editing - Markdown
	use({ "coachshea/vim-textobj-markdown" })
	use("dhruvasagar/vim-table-mode")
	use("dkarter/bullets.vim")

	--- Text editing - HTML
	use({ "alvan/vim-closetag" })
	use({ "Glench/Vim-Jinja2-Syntax" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
