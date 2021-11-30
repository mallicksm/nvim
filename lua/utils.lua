local M = {}

function M.kmap(mode, key, vim_cmd)
  vim.api.nvim_set_keymap( mode, key, vim_cmd,
    {noremap = true, silent = true}
  )
end
return M


