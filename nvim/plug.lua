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
	use({ "nvim-tree/nvim-web-devicons" })

	-- LSP configures the servers
	-- Mason sets up the servers
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate",
	})

	-- Completion with CMP

	use({ "norcalli/nvim-colorizer.lua" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "kana/vim-textobj-user" })

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
