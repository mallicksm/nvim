-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd            -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn              -- call Vim functions
local g = vim.g                -- global variables
local opt = vim.opt            -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','             -- change leader to a comma
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line #s
opt.relativenumber = true        -- Cool cursor-relative #s
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- horizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true             -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary
opt.scrolloff = 5             -- stop scrolling at 5 lines for better context
-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]


-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true      -- enable 24-bit RGB colors
cmd [[colorscheme rose-pine]]

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 3        -- shift 4 spaces when tab
opt.tabstop = 3           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
opt.signcolumn = 'yes:1'  -- fix sign column to 1 so it doesnt shift right
opt.wildmenu = true
opt.wildmode = 'longest:full,full'

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = 'menuone,noselect'

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- disable nvim intro
opt.shortmess:append "sI"
