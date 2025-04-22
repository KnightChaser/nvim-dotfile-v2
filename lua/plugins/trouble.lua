-- lua/plugins/trouble.lua
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional icons
  cmd = { "Trouble", "TroubleToggle" },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Document Symbols" },
    { "<leader>cl", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "LSP Definitions" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
    { "<leader>xQ", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix List" },
  },
  opts = {
    -- put any custom settings here; empty = use defaults
    -- e.g. auto_open = false, auto_close = true, etc.
  },
  config = function(_, opts)
    require("trouble").setup(opts)
  end,
}
