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
local fn = vim.fn
-----------------------------------------------------------
-- Fix rtp
-----------------------------------------------------------
vim.opt.rtp:prepend('$HOME/.config/svim')
vim.opt.rtp:prepend('$HOME/.local/share/svim/git-svim')
vim.opt.rtp:prepend('$HOME/.local/share/svim')

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
-- Auto install packer.nvim
local install_path = '$HOME/.local/share/svim/site/pack/packer/start/packer.nvim'

if fn.isdirectory(install_path) == 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  require('plugins/packer')
  vim.cmd 'autocmd User PackerComplete ++once lua require("config")'
  require('packer').sync()
else
   require('config')
end
