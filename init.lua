--[[
      ███╗   ██╗██╗   ██╗██╗███╗   ███╗
      ████╗  ██║██║   ██║██║████╗ ████║
      ██╔██╗ ██║██║   ██║██║██╔████╔██║
      ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

Neovim init file
Maintainer: Soummya Mallick
]]
local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.isdirectory(install_path) == 0 then
   fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
   require('plugins/packer')
   require('packer').sync()
   vim.cmd 'autocmd User PackerComplete lua require("config")'
   vim.cmd 'autocmd User PackerComplete :call mkdp#util#install()'
else
   require('plugins/packer')
   require('config')
end
