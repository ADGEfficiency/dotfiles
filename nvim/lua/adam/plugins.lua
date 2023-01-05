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

-- Install your plugins here
return packer.startup(function(use)
  -- base
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

  -- bufferline (top)
  use("noib3/nvim-cokeline")

  -- lualine (bottom)
  use({ "nvim-lualine/lualine.nvim" })

  -- -- greeter/dashboard - alpha
  use({ "goolord/alpha-nvim" })
  use({ "kyazdani42/nvim-web-devicons" })

  -- treesitter
  use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
  -- use( "ray-x/cmp-treesitter")

  -- -- -- colormap
  use("sainnhe/everforest")
  use("dracula/vim")
  use("catppuccin/nvim")
  -- -- use("sam4llis/nvim-tundra")
  use("rebelot/kanagawa.nvim")

  -- -- cmp plugins
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("dmitmel/cmp-cmdline-history")
  use("hrsh7th/cmp-emoji")
  use("hrsh7th/cmp-latex-symbols")
  use("uga-rosa/cmp-dictionary")
  use("David-Kunz/cmp-npm") -- npm packages (package.json)
  use("hrsh7th/cmp-nvim-lsp") -- lsp completions
  use("amarakon/nvim-cmp-buffer-lines")

  -- snippets
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("L3MON4D3/LuaSnip")

  -- -- lsp
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("jose-elias-alvarez/null-ls.nvim")
  use("ray-x/lsp_signature.nvim")

  -- git
  use("lewis6991/gitsigns.nvim")

  -- telescope
  use("nvim-telescope/telescope.nvim")
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })
  use({"ptethng/telescope-makefile"})

  -- -- text editing
  use("tpope/vim-commentary")
  use("windwp/nvim-autopairs")
  use("FooSoft/vim-argwrap")
  use("mattn/emmet-vim")
  use({ "tpope/vim-surround" })
  use({ "tpope/vim-repeat" })

  -- text editing - python
  use("Vimjas/vim-python-pep8-indent")

  --- text editing - markdown
  use("dhruvasagar/vim-table-mode")
  use("dkarter/bullets.vim")
  -- use("ixru/nvim-markdown")
  -- use("plasticboy/vim-markdown")

  -- reopen last place
  use("farmergreg/vim-lastplace")

  -- trailing space removal
  use("axelf4/vim-strip-trailing-whitespace")

  -- better quick fix window
  use({ "kevinhwang91/nvim-bqf", ft = "qf" })

  use({ "simeji/winresizer" })

  use({ "qpkorr/vim-bufkill" })

  use({ "Glench/Vim-Jinja2-Syntax" })

  use({ "mhinz/vim-grepper" })

  -- use({"aduros/ai.vim"})
  --
  use ({ "lieryan/vim-jumpsuite" })

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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
