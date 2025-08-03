-- lua/plugins/dropbar.lua
return {
  {
    "Bekaboo/dropbar.nvim",
    cond = function()
      -- only load on Neovim ≥ 0.11.0
      return vim.fn.has("nvim-0.11") == 1
    end,
    -- load when opening or creating a file buffer
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("dropbar").setup({
        bar = {
          enable = function(bufnr, winid, ctx)
            -- only in normal file buffers
            local bt = vim.bo[bufnr].buftype
            if bt ~= "" then
              return false
            end
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
