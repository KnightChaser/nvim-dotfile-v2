-- lua/plugins/lspconfig.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- this hook runs before each server’s setup()
      setup = {
        clangd = function(_, opts)
          -- merge in utf-16 offsetEncoding
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },
}
