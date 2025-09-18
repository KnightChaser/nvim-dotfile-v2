-- lua/plugins/mason-lspconfig.lua
return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim", -- make sure mason is loaded first
  },
  event = "LspAttach", -- load when any LSP attaches
  opts = {
    -- install these out of the box:
    ensure_installed = { "clangd", "gopls", "pyright" },
    -- auto‑install any server you call via lspconfig.setup{}
    automatic_installation = true,
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)
  end,
}
