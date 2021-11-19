-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- map Esc to kk
map('i', 'jk', '<Esc>', {noremap = true})
map('i', 'kj', '<Esc>', {noremap = true})
map('i', 'kk', '<Esc>', {noremap = true})
map('i', 'jj', '<Esc>', {noremap = true})

-- Vscode: mapping
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', {noremap = true})
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', {noremap = true})
map('n', '<A-j>', ':m .+1<CR>==', {noremap = true})
map('n', '<A-k>', ':m .-2<CR>==', {noremap = true})
map('v', '<A-j>', ":m '>+1<CR>gv-gv", {noremap = true})
map('v', '<A-k>', ":m '<-2<CR>gv-gv", {noremap = true})
map('i', '<A-down>', '<Esc>:m .+1<CR>==gi', {noremap = true})
map('i', '<A-up>', '<Esc>:m .-2<CR>==gi', {noremap = true})
map('n', '<A-down>', ':m .+1<CR>==', {noremap = true})
map('n', '<A-up>', ':m .-2<CR>==', {noremap = true})
map('v', '<A-down>', ":m '>+1<CR>gv-gv", {noremap = true})
map('v', '<A-up>', ":m '<-2<CR>gv-gv", {noremap = true})

-- Window resizing
map('n', '<C-Up>', ':resize -2<CR>', { noremap = true })
map('n', '<C-Down>', ':resize +2<CR>', { noremap = true })
map('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true })
map('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true })

-- fast saving with <leader> and w
map('n', '<leader>w', ':w<CR>', default_opts)
map('i', '<leader>w', '<C-c>:w<CR>', default_opts)

-- spltting with <leader> and s/i
map('n', '<leader>s', ':split<CR>', default_opts)
map('n', '<leader>i', ':vsplit<CR>', default_opts)

-- move around splits using <leader> + {h,j,k,l}
map('n', '<leader>h', '<C-w>h', default_opts)
map('n', '<leader>j', '<C-w>j', default_opts)
map('n', '<leader>k', '<C-w>k', default_opts)
map('n', '<leader>l', '<C-w>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>X', ':qa!<CR>', default_opts)
map('n', '<leader>q', ':q<CR>', default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Vista tag-viewer
map('n', '<C-m>', ':Vista!!<CR>', default_opts)   -- open/close
