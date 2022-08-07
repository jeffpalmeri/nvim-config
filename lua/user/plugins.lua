-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
  use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- Completions from LSP
  use "hrsh7th/cmp-nvim-lsp"
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


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
