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
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- colorschemes
  use { 'rose-pine/neovim', as = 'rose-pine' }

  use { 'preservim/nerdtree',
    requires = {
      use 'ryanoasis/vim-devicons', 
      use 'tiagofumo/vim-nerdtree-syntax-highlight',
      use 'Xuyuanp/nerdtree-git-plugin',
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
      },
      use 'kyazdani42/nvim-web-devicons'
    }
  }
   -- indent line
   use { 'lukas-reineke/indent-blankline.nvim' }

   -- telescope
   use {
      use 'nvim-telescope/telescope.nvim',
      requires = {
         use 'ThePrimeagen/git-worktree.nvim'
      }
   }
   use { 'iamcco/markdown-preview.nvim' }
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
