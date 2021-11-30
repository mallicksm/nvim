-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------
local kmap = function(mode, key, vim_cmd)
  vim.api.nvim_set_keymap( mode, key, vim_cmd,
    {noremap = true, silent = true}
  )
end

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
kmap('n', '<leader>c', ':nohl<CR>')

-- Vscode: mapping
kmap('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
kmap('n', '<A-j>', ':m .+1<CR>==')
kmap('v', '<A-j>', ":m '>+1<CR>gv-gv")
kmap('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
kmap('n', '<A-k>', ':m .-2<CR>==')
kmap('v', '<A-k>', ":m '<-2<CR>gv-gv")
kmap('i', '<A-down>', '<Esc>:m .+1<CR>==gi')
kmap('n', '<A-down>', ':m .+1<CR>==')
kmap('v', '<A-down>', ":m '>+1<CR>gv-gv")
kmap('i', '<A-up>', '<Esc>:m .-2<CR>==gi')
kmap('n', '<A-up>', ':m .-2<CR>==')
kmap('v', '<A-up>', ":m '<-2<CR>gv-gv")

-- Window resizing
kmap('n', '<C-Up>', ':resize -2<CR>')
kmap('n', '<C-Down>', ':resize +2<CR>')
kmap('n', '<C-Left>', ':vertical resize -2<CR>')
kmap('n', '<C-Right>', ':vertical resize +2<CR>')

-- fast saving with <leader> and w
kmap('n', '<leader>w', ':w<CR>')
kmap('i', '<leader>w', '<C-c>:w<CR>')

-- spltting with <leader> and s/i
kmap('n', '<leader>s', ':split<CR>')
kmap('n', '<leader>i', ':vsplit<CR>')

-- move around splits using <leader> + {h,j,k,l}
kmap('n', '<leader>h', '<C-w>h')
kmap('n', '<leader>j', '<C-w>j')
kmap('n', '<leader>k', '<C-w>k')
kmap('n', '<leader>l', '<C-w>l')

-- close windows or exit from neovim
kmap('n', '<leader>X', ':qa!<CR>')
kmap('n', '<leader>q', ':q<CR>')

-- Convinient mappings
kmap('v', '>', '>gv')
kmap('v', '<', '<gv')
kmap('i', 'jj', '<ESC>')
kmap('n', 'gf', ':e <cfile><CR>')
kmap('n', 'gF', ':tabe <cfile><CR>')


-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open/close terminal
kmap('n', '<leader>T', ':sp<CR> :term<CR>')
kmap('t', '<Esc>', '<C-\\><C-n>')

-- Vista tag-viewer
kmap('n', '<C-m>', ':Vista!!<CR>')
