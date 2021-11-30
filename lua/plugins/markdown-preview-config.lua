local g = vim.g                -- global variables
local kmap = function(mode, key, vim_cmd)
  vim.api.nvim_set_keymap( mode, key, vim_cmd,
    {noremap = true, silent = true}
  )
end

kmap('n', '<leader>mp', ':MarkdownPreviewToggle<CR>')
