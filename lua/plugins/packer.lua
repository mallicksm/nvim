-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- colorschemes
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- file explorer
  use { 'kyazdani42/nvim-tree.lua',
    requires = {
      use 'kyazdani42/nvim-web-devicons'
    }
  }

  -- statusline
  use {
    'famiu/feline.nvim',
    requires = {
      use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
          require('gitsigns').setup()
        end,
      }
    }
  }
   -- indent line
   use 'lukas-reineke/indent-blankline.nvim'

   -- telescope
   use {
      use 'nvim-telescope/telescope.nvim',
      requires = {
         use 'ThePrimeagen/git-worktree.nvim'
      }
   }

  --use 'nvim-treesitter/nvim-treesitter'

-- -- LSP -Project-based highlighting
--  use 'neovim/nvim-lspconfig'
--
-- -- autopair
-- use 'windwp/nvim-autopairs'
--
-- -- icons
--
-- -- tagviewer
-- use 'liuchengxu/vista.vim'
--
-- -- treesitter interface
-- use 'nvim-treesitter/nvim-treesitter'
--
-- -- autocomplete
-- use {
--   'hrsh7th/nvim-cmp',
--   requires = {
--     'L3MON4D3/LuaSnip',
--     'hrsh7th/cmp-nvim-lsp',
--     'hrsh7th/cmp-path',
--     'hrsh7th/cmp-buffer',
--     'saadparwaiz1/cmp_luasnip',
--   },
-- }
end)
