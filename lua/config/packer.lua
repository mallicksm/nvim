-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- https://github.com/wbthomason/packer.nvim
-- https://github.com/brainfucksec/neovim-lua#readme

vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- colorschemes
--  use { 'rose-pine/neovim', as = 'rose-pine' }
--  use { 'bluz71/vim-moonfly-colors', as = 'moonfly' }
--  use { 'ChristianChiarulli/nvcode-color-schemes.vim', as = 'nvcode' }
--  use { 'GlennLeo/cobalt2', as =  'cobalt2' }
  use { 'folke/tokyonight.nvim', as =  'tokyonight' }
  use { 'sainnhe/sonokai', as =  'sonokai' }
  use { 'tanvirtin/monokai.nvim', as = 'monokai' }

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
      'nvim-telescope/telescope.nvim',
      requires = {
         use 'ThePrimeagen/git-worktree.nvim'
      }
   }
   -- Previews markdown files on browser
   use { 'iamcco/markdown-preview.nvim' }

   -- floaterm
   use { 'voldikss/vim-floaterm' }
   -- Search visual pattern with * or #
   use { 'nelstrom/vim-visual-star-search' }

 -- "gc" to comment visual regions/lines
   use { 'numToStr/Comment.nvim' }

 -- "gd/gq" to open/close diffview
   use { 'sindrets/diffview.nvim' }

-- treesitter
-- use {'prettier/vim-prettier', run = 'npm install' }
   use {
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
   }
   use { 'sheerun/vim-polyglot' }
-- lsp
   use 'neovim/nvim-lspconfig'
   use 'nvim-lua/completion-nvim'
   use 'anott03/nvim-lspinstall'

end)
