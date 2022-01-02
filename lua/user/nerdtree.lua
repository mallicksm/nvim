-- https://github.com/preservim/nerdtree
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.NERDTreeWinSize = 35
vim.g.NERDTreeBookmarksSort = true
vim.g.NERDTreeShowBookmarks = true
vim.g.NERDTreeShowLineNumbers = true
vim.g.NERDTreeMinimalUI = true
vim.g.NERDTreeSortOrder = { "/$", "[[-timestamp]]", "*" }
vim.g.DevIconsEnableFoldersOpenClose = true
