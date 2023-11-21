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

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- packer manages itself
	use({
		"wbthomason/packer.nvim",
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
	})
	use({ "nvim-tree/nvim-web-devicons" })

	-- lsp + mason
	-- lsp configures the servers
	-- mason sets up the servers
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate",
	})
	-- use("ray-x/lsp_signature.nvim")

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	use({ "mfussenegger/nvim-lint" })

	-- LSP diagnostics list
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				height = 5, -- height of the trouble list when position is top or bottom
				width = 50, -- width of the list when position is left or right
				icons = false, -- use devicons for filenames
				indent_lines = false, -- add an indent guide below the fold icons
				auto_open = false, -- automatically open the list when you have diagnostics
				auto_close = false, -- automatically close the list when you have no diagnostics
			})
		end,
	})

	-- top bar - buffers
	use({
		"romgrk/barbar.nvim",
		requires = "nvim-web-devicons",
	})

	-- bottom bar - status line
	use({ "nvim-lualine/lualine.nvim" })

	-- greeter
	use({ "goolord/alpha-nvim" })

	-- treesitter for syntax highlighting
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- colormaps
	use("sainnhe/everforest")
	use("dracula/vim")
	use("catppuccin/nvim")
	use("sam4llis/nvim-tundra")
	use("rebelot/kanagawa.nvim")

	-- completion with cmp
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

	-- snippets
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- searching with telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({ "ptethng/telescope-makefile" })

	-- searching with grepper
	use({ "mhinz/vim-grepper" })

	-- showing potential keyboard shortcuts
	use("folke/which-key.nvim")

	-- buffer / window management
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ "simeji/winresizer" })
	use({ "qpkorr/vim-bufkill" })

	-- text editing
	use("tpope/vim-commentary")
	use("windwp/nvim-autopairs")
	use("FooSoft/vim-argwrap")
	use("mattn/emmet-vim")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("lewis6991/gitsigns.nvim")
	use("farmergreg/vim-lastplace")
	use("axelf4/vim-strip-trailing-whitespace")
	use({ "mbbill/undotree" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			-- Define a custom highlight group for indent lines
			vim.api.nvim_set_hl(0, "CustomIndent", { fg = "#6272A4" })
			-- Setup indent-blankline with the custom highlight group
			require("ibl").setup({
				indent = {
					char = "┆",
					highlight = { "CustomIndent" }, -- Using the custom highlight group
				},
			})
		end,
	})

	-- text editing - python
	use("Vimjas/vim-python-pep8-indent")

	--- text editing - markdown
	use("dhruvasagar/vim-table-mode")
	use("dkarter/bullets.vim")

	--- text editing - html
	use({ "alvan/vim-closetag" })
	use({ "Glench/Vim-Jinja2-Syntax" })

	-- color highlighter
	use({ "norcalli/nvim-colorizer.lua" })

	use({ "zbirenbaum/copilot.lua" })

	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	use({ "windwp/nvim-ts-autotag" })

	use({ "NoahTheDuke/vim-just" })

	use({ "kana/vim-textobj-user" })
	use({ "bps/vim-textobj-python" })
	use({ "coachshea/vim-textobj-markdown" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
