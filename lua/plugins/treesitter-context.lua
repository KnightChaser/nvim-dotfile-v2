-- lua/plugins/treesitter-context.lua
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufNewFile" }, -- lazy‑load after a buffer is opened
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- ensure TS core is loaded first
  },
  opts = {
    enable = true, -- turn the plugin on
    line_numbers = true,
    separator = "─",
    max_lines = 0, -- no limit
    min_window_height = 0, -- no limit
    multiline_threshold = 20,
    trim_scope = "outer",
    mode = "cursor",
    zindex = 20,
    on_attach = nil,
  },
  config = function(_, opts)
    require("treesitter-context").setup(opts)
  end,
}
