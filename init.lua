--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝


Neovim init file
Version: 0.32.0 - 2021/11/08
Maintainer: Brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------

local fn = vim.fn

-- Auto install packer.nvim
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.isdirectory(install_path) == 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  require('plugins/packer')
  vim.cmd 'autocmd User PackerComplete ++once lua require("config")'
  require('packer').sync()
else
   require('config')
end
