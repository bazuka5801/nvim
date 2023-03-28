vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }
  use 'sainnhe/everforest'

  use 'rmagatti/alternate-toggler'
  use 'windwp/nvim-autopairs'
  use 'mg979/vim-visual-multi'
  use 'gcmt/wildfire.vim'
  use 'tpope/vim-surround'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'MattesGroeger/vim-bookmarks'
  use 'tom-anders/telescope-vim-bookmarks.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'
  use 'David-Kunz/cmp-npm'
  use 'hrsh7th/cmp-calc'
  use 'lukas-reineke/cmp-rg'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'jose-elias-alvarez/typescript.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'axelvc/template-string.nvim'
  use 'j-hui/fidget.nvim'
  use 'folke/todo-comments.nvim'


  use({
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })

  use 'numToStr/Comment.nvim'
  use 'AndrewRadev/sideways.vim'
  use({
    'akinsho/toggleterm.nvim',
    tag = '*'
  })
  use 'tpope/vim-obsession'
  use 'dhruvasagar/vim-prosession'
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use {
    'neoclide/coc.nvim', branch = 'release'
  }
  use 'NvChad/nvim-colorizer.lua'
  use 'fannheyward/telescope-coc.nvim'
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  })
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'phaazon/hop.nvim',
    branch = 'v2'
  }
  use 'mbbill/undotree'
  use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
end)
