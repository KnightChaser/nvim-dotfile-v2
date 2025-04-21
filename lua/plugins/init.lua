-- lua/plugins/init.lua
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
      window = {
        width = 30,
        mappings = {
          ["<cr>"] = "open",
          ["S"] = "open_split",
          ["<space>"] = "toggle_node",
        },
      },
    },
    keys = {
      { "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Toggle Neo‑tree" },
    },
  },
}
