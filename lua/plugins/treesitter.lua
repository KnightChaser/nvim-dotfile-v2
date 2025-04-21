-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- keep parsers up‑to‑date
  event = { "BufReadPre", "BufNewFile" }, -- lazy‑load on file open
  opts = {
    ensure_installed = { "c", "go", "python", "lua", "bash" },
    auto_install = true, -- install missing parsers on enter
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    textobjects = { -- optional: movement & selection
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = { ["<leader>a"] = "@parameter.inner" },
        swap_previous = { ["<leader>A"] = "@parameter.inner" },
      },
      move = {
        enable = true,
        goto_next_start = { ["]m"] = "@function.outer" },
        goto_previous_start = { ["[m"] = "@function.outer" },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
