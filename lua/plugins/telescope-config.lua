local telescope = require("telescope")
local kmap = function(mode, key, vim_cmd)
  vim.api.nvim_set_keymap( mode, key, vim_cmd,
    {noremap = true, silent = true}
  )
end


telescope.setup{
   pickers = {
      find_files = {
         theme = "ivy",
      }
   }
}

telescope.load_extension("git_worktree")

kmap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>")
kmap('n', '<leader>fr', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
kmap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
kmap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")
kmap('n', '<leader>fg', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
