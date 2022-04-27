return {
   Lua = {
      diagnostics = {
         globals = { "vim" },
      },
      workspace = {
         library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
            [vim.fn.stdpath("config") .. "/lua/user"] = true,
            [vim.fn.stdpath("config") .. "/lua/user/lsp"] = true,
            [vim.fn.stdpath("config") .. "/lua/user/lsp/settings"] = true,
            [vim.fn.stdpath("data") .. "/site/pack/packer/start"] = true,
            [vim.fn.stdpath("data") .. "/site/pack/packer/opt"] = true,
         },
      },
   },
}
