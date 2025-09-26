-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "c",
        "go",
        "python",
        "lua",
        "bash",
        "query",
        "vim",
        "vimdoc",
        "regex",
        "markdown",
        "markdown_inline",
        "json",
        "yaml",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local ok, st = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and st and st.size > 200 * 1024
        end,
      },
      indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>vi",
          node_incremental = "<leader>vn",
          node_decremental = "<leader>vp",
          scope_incremental = "<leader>vs",
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
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
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
