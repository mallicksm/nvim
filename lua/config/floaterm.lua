local g = vim.g
local kmap = require('utils').kmap

g.floaterm_keymap_toggle = '<F1>'
g.floaterm_keymap_next   = '<F2>'
g.floaterm_keymap_prev   = '<F3>'
g.floaterm_keymap_new    = '<F4>'
g.floaterm_gitcommit='floaterm'
g.floaterm_autoinsert=1
g.floaterm_width=0.8
g.floaterm_height=0.8
g.floaterm_wintitle=0
g.floaterm_autoclose=1

kmap('n', '<leader>flg', ':FloatermNew lazygit<CR>')
kmap('n', '<leader>fzf', ':FloatermNew ranger<CR>')
kmap('n', '<leader>fgl', ':FloatermNew glances<CR>')

vim.cmd[[
augroup FloatermCustomisations
    autocmd!
    autocmd ColorScheme * highlight FloatermBorder guifg=orange guibg=black
augroup END
]]
