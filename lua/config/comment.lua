--local res, comment = pcall(require, "Comment")
--if not res then
--  return
--end

require('Comment').setup {

    opleader = {
        line = 'gl',
        block = 'gc',
    },

   keys = {'gcc', 'gc', 'gl'},
    pre_hook = nil,
    post_hook = nil,
}
