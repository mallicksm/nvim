local M = {}

function M.kmap(mode, key, vim_cmd)
  vim.api.nvim_set_keymap( mode, key, vim_cmd,
    {noremap = true, silent = true}
  )
end

-- Credit to uga-rosa@github
-- https://github.com/uga-rosa/dotfiles/blob/main/.config/nvim/lua/utils.lua

---Return a string for vim from a lua function.
---Functions are stored in _G.myluafunc.
---@param func function
---@return string VimFunctionString
_G.myluafunc = setmetatable({}, {
  __call = function(self, idx, args, count)
    return self[idx](args, count)
  end,
})

local func2str = function(func, args)
  local idx = #_G.myluafunc + 1
  _G.myluafunc[idx] = func
  if not args then
    return ("lua myluafunc(%s)"):format(idx)
  else
    -- return ("lua myluafunc(%s, <q-args>)"):format(idx)
    return ("lua myluafunc(%s, <q-args>, <count>)"):format(idx)
  end
end

---API for key mapping.
---
---@param lhs string
---@param modes string|table
---@param rhs string|function
---@param opts string|table
--- opts.buffer: current buffer only
--- opts.cmd: command (format to <cmd>%s<cr>)
M.remap = function(modes, lhs, rhs, opts)
  modes = type(modes) == "string" and { modes } or modes
  opts = opts or {}
  opts = type(opts) == "string" and { opts } or opts

  local fallback = function()
    return vim.api.nvim_feedkeys(M.t(lhs), "n", true)
  end

  local _rhs = (function()
    if type(rhs) == "function" then
      opts.noremap = true
      opts.cmd = true
      return func2str(function()
        rhs(fallback)
      end)
    else
      return rhs
    end
  end)()

  for key, opt in ipairs(opts) do
    opts[opt] = true
    opts[key] = nil
  end

  local buffer = (function()
    if opts.buffer then
      opts.buffer = nil
      return true
    end
  end)()

  _rhs = (function()
    if opts.cmd then
      opts.cmd = nil
      return ("<cmd>%s<cr>"):format(_rhs)
    else
      return _rhs
    end
  end)()

  for _, mode in ipairs(modes) do
    if buffer then
      vim.api.nvim_buf_set_keymap(0, mode, lhs, _rhs, opts)
    else
      vim.api.nvim_set_keymap(mode, lhs, _rhs, opts)
    end
  end
end

return M


