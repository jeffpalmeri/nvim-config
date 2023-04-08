-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
  -- else
  -- print "Packer is already installed"
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]] -- I'm not sure what this means

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- Completions from LSP
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip"
  -- use 'hrsh7th/cmp-cmdline'

  -- snippets
  -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- use "williamboman/mason.nvim"

  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP congif plugin from Neovim core
  use "williamboman/nvim-lsp-installer" -- simple to use language server installed

  use "onsails/lspkind-nvim"

  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'

  use 'Mofiqul/vscode.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- use {
  --   'nvim-telescope/telescope.nvim', tag = '0.1.0',
  --   -- or                            , branch = '0.1.x',
  --   requires = { { 'nvim-lua/plenary.nvim' } }
  -- }
  use {
    'nvim-telescope/telescope.nvim',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- Colorschemes
  -- use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  -- use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  -- use { "lunarvim/darkplus.nvim" }
  -- use { "gutyina70/darkplus.nvim", branch = "fix-whitespace-rendering" }
  -- autopairs
  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- }

  -- Nerdtree
  -- use 'preservim/nerdtree'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- gitsigns
  use { 'lewis6991/gitsigns.nvim' }


  -- Smooth scrolling plugin
  use 'karb94/neoscroll.nvim'

  -- tabs
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }

  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons' }
  -- }

  -- use '/Users/jpalmeri/Documents/personal/learning-lua-plugins'
  use '/Users/jpalmeri/Documents/personal/stackmap.nvim'

  -- Toggle Term
  --use { "akinsho/toggleterm.nvim", tag = '*', config = function()
  --require("toggleterm").setup()
  --end }
  use "akinsho/toggleterm.nvim"


  -- Comment plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Colorizer.lua
  use {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup()
    end,
  }

  use { "catppuccin/nvim", as = "catppuccin" }
  use 'folke/tokyonight.nvim'
  use "jose-elias-alvarez/null-ls.nvim"
  use "sindrets/diffview.nvim"

  use 'MunifTanjim/nui.nvim'

  use "lukas-reineke/indent-blankline.nvim"




  use { 'kevinhwang91/nvim-bqf' }
  -- use {
  --   "zbirenbaum/neodim",
  --   event = "LspAttach"
  -- }

  -- Testing lualine
  --   use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  -- }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
