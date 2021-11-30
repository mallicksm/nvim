-- https://github.com/iamcco/markdown-preview.nvim
local g = vim.g
local kmap = require('utils').kmap

kmap('n', '<leader>mp', ':MarkdownPreviewToggle<CR>')
