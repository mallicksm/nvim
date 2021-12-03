-- https://github.com/preservim/nerdtree
local g = vim.g
local kmap = require('utils').kmap

g.NERDTreeWinSize = 35
g.NERDTreeBookmarksSort = true
g.NERDTreeShowBookmarks = true
g.NERDTreeShowLineNumbers = true
g.NERDTreeMinimalUI = true
g.NERDTreeSortOrder = {'/$', '*', '[[timestamp]]'}
g.DevIconsEnableFoldersOpenClose = true
vim.cmd [[
nnoremap <expr> <leader>e g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
]]
kmap('n', '<leader>f', '<CMD>NERDTreeFind<CR>')
