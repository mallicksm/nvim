-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: feline.nvim
-- https://github.com/famiu/feline.nvim

-- For the configuration see the Usage section:
--- https://github.com/famiu/feline.nvim/blob/master/USAGE.md

-- Thanks to ibhagwan for the example to follow:
--- https://github.com/ibhagwan/nvim-lua

local status_ok, feline = pcall(require, "feline")
if not status_ok then
   return
end

local colors = {
   bg = "#111019",
   fg = "#e0def4",
   pink = "#eb6f92",
   green = "#59ad3b",
   cyan = "#31748f",
   yellow = "#f6c177",
   orange = "#2a2837",
   purple = "#c4a7e7",
   red = "#ebbcba",
}

-- default feline colors
local vi_mode_colors = {
   NORMAL = "green", --Normal mode
   OP = "green", --Operator pending mode
   INSERT = "yellow", --Insert mode
   VISUAL = "skyblue", --Visual mode
   LINES = "skyblue", --Visual lines mode
   BLOCK = "skyblue", --Visual block mode
   REPLACE = "violet", --Replace mode
   ["V-REPLACE"] = "violet", --Virtual Replace mode
   ENTER = "cyan", --Enter mode
   MORE = "cyan", --More mode
   SELECT = "orange", --Select mode
   COMMAND = "red", --Command mode
   SHELL = "green", --Shell mode
   TERM = "green", --Terminal mode
   NONE = "yellow", --None
}

local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local lsp_get_diag = function(str)
   local count = vim.lsp, diagnostic.get_count(0, str)
   return (count > 0) and " " .. count .. " " or ""
end

-- My components
local comps = {
   -- vi_mode -> NORMAL, INSERT..
   vi_mode = {
      left = {
         provider = function()
            local label = " " .. vi_mode_utils.get_vim_mode() .. " "
            return label
         end,
         hl = function()
            local set_color = {
               name = vi_mode_utils.get_mode_highlight_name(),
               fg = colors.bg,
               bg = vi_mode_utils.get_mode_color(),
               style = "bold",
            }
            return set_color
         end,
         left_sep = " ",
         right_sep = " ",
      },
   },
   -- parse file information
   file = {
      -- file name
      info = {
         provider = {
            name = "file_info",
            opts = {
               type = "relative",
               file_modified_icon = "",
            },
         },
         hl = { fg = colors.green },
         icon = "",
      },
      -- file type
      type = {
         provider = { name = "file_type" },
         left_sep = " ",
         right_sep = "",
      },
      -- operating system
      os = {
         provider = function()
            local os = vim.bo.fileformat:lower()
            local icon
            if os == "unix" then
               icon = "  "
            elseif os == "mac" then
               icon = "  "
            else
               icon = "  "
            end
            return icon .. os
         end,
         hl = { fg = colors.fg },
         left_sep = "",
         right_sep = " ",
      },
      -- cursor position in %
      line_percentage = {
         provider = { name = "line_percentage" },
         hl = { fg = colors.pink },
         left_sep = " ",
         right_sep = " ",
      },
      -- raw-column
      position = {
         provider = { name = "position" },
         hl = {
            fg = colors.cyan,
            style = "bold",
         },
         right_sep = " ",
      },
   },
   -- LSP info
   diagnos = {
      err = {
         provider = { name = "diagnostic_errors" },
         icon = "⚠ ",
         hl = { fg = "red" },
         left_sep = "  ",
      },
      warn = {
         provider = { name = "diagnostic_warnings" },
         icon = " ",
         hl = { fg = "yellow" },
         left_sep = " ",
      },
      info = {
         provider = { name = "diagnostic_info" },
         icon = " ",
         hl = { fg = "green" },
         left_sep = " ",
      },
      hint = {
         provider = { name = "diagnostic_hints" },
         icon = " ",
         hl = { fg = "cyan" },
         left_sep = " ",
      },
   },
   lsp = {
      name = {
         provider = { name = "lsp_client_names" },
         icon = "  ",
         hl = { fg = "pink" },
         left_sep = "  ",
      },
   },
   -- git info
   git = {
      branch = {
         provider = { name = "git_branch" },
         icon = " ",
         hl = { fg = "pink" },
         left_sep = "  ",
      },
      add = {
         provider = { name = "git_diff_added" },
         icon = "  ",
         hl = { fg = "green" },
         left_sep = " ",
      },
      change = {
         provider = { name = "git_diff_changed" },
         icon = "  ",
         hl = { fg = "orange" },
         left_sep = " ",
      },
      remove = {
         provider = { name = "git_diff_removed" },
         icon = "  ",
         hl = { fg = "red" },
         left_sep = " ",
      },
   },
}

-- Get active/inactive components
--- see: https://github.com/famiu/feline.nvim/blob/master/USAGE.md#components
local components = {
   active = {},
   inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Left section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.file.info)

-- Right Section
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.type)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.file.line_percentage)
table.insert(components.active[2], comps.file.position)
table.insert(components.inactive[2], comps.file.position)

-- call feline
feline.setup({
   colors = {
      bg = colors.bg,
      fg = colors.fg,
   },
   components = components,
   vi_mode_colors = vi_mode_colors,
   force_inactive = {
      filetypes = {
         "NvimTree",
         "vista",
         "term",
      },
      buftypes = {},
      bufnames = {},
   },
})
