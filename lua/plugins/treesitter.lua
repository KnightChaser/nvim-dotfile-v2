-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = { "c", "go", "python", "lua", "bash" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      -- Incremental selection (all under <leader>v …)
      incremental_selection = {
        enable = true,
        keymaps = {
          -- TODO: Fix these keymaps to use <leader> later
          init_selection = "m", -- start selection
          node_incremental = "M", -- grow to next node
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          -- NOTE: these only apply in operator-pending/visual,
          -- so 'af' won't hijack normal-mode 'a' anymore.
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
          goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
          goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
          goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
        },
        swap = {
          enable = true,
          swap_next = { ["<leader>sn"] = "@parameter.inner" },
          swap_previous = { ["<leader>sp"] = "@parameter.inner" },
        },
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate()
        end,
        desc = "Generate doc",
      },
      {
        "<leader>cN",
        function()
          require("neogen").generate({ type = "class" })
        end,
        desc = "Doc: class",
      },
    },
    opts = { snippet_engine = "luasnip", enabled = true },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
