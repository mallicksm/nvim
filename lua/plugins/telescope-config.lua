local g = vim.g
local kmap = require('utils').kmap
local telescope = require('telescope')

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
