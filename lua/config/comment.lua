-- https://github.com/numToStr/Comment.nvim
require('Comment').setup {

    opleader = {
        line = 'gl',
        block = 'gc',
    },

   keys = {'gcc', 'gc', 'gl'},
    pre_hook = nil,
    post_hook = nil,
}
