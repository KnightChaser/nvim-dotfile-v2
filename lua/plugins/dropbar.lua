return {
  {
    "Bekaboo/dropbar.nvim",
    -- only load on Neovim >= 0.11.0 due to its requirement.
    cond = function()
      -- returns 1 only if the version is 0.11.0 or higher
      return vim.fn.has("nvim-0.11") == 1
    end,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      require("dropbar").setup({
        bar = {
          enable = function()
            return true
          end,
        },
      })

      local api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", api.select_next_context, { desc = "Select next context" })
    end,
  },
}
