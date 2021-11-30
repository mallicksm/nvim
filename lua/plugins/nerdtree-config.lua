local g = vim.g                -- global variables
local kmap = function(mode, key, vim_cmd)
  vim.api.nvim_set_keymap( mode, key, vim_cmd,
    {noremap = true, silent = true}
  )
end

g.NERDTreeDelimiter = "\t"
g.NERDTreeWinSize = 35

-- g.NERDTreeIgnore = {'.svn$', '.git$', '.d$', '.o$'}
g.NERDTreeBookmarksSort = true
g.NERDTreeShowBookmarks = true
g.NERDTreeShowLineNumbers = true
g.NERDTreeMinimalUI = true
g.NERDTreeDirArrows = 0
g.WebDevIconsUnicodeDecorateFolderNodes = 1
g.DevIconsEnableFoldersOpenClose = 1
g.DevIconsEnableFolderExtensionPatternMatching = 1

vim.cmd [[nnoremap <expr> <leader>e g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>']]
kmap('n', '<leader>f', '<CMD>NERDTreeFind<CR>')
