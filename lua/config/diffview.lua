local kmap = require('utils').kmap
local diffview = require('diffview')
kmap('n', 'gq', '<CMD>DiffviewClose<CR>')
kmap('n', 'gd', '<CMD>DiffviewOpen<CR>')
