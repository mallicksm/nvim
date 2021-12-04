-- https://github.com/nvim-treesitter/nvim-treesitter
local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = {
    'c',
    'lua',
    'cpp',
    'bash',
    'python',
    'cmake',
    'dockerfile',
    'html',
    'json',
    'json5',
    'jsonc',
    'llvm',
    'perl',
    'php',
    'regex',
    'rust',
    'rst',
    'verilog',
    'vim',
    'yaml',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    },
  },
  indent = {
     enable = true
  },
}
vim.api.nvim_exec([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]], false)
