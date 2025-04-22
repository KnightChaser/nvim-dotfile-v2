-- lua/plugins/barbar.lua
return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- icons (optional)
      "lewis6991/gitsigns.nvim", -- git indicators (optional)
    },
    init = function()
      -- disable automatic setup so we can pass opts by ourselves
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = true,
      auto_hide = false,
      tabpages = true,
      clickable = true,
      focus_on_close = "left",
      icons = {
        button = "",
        pinned = { button = "" },
        separator = { left = "▎", right = "" },
      },
      sidebar_filetypes = {
        NvimTree = true,
        ["neo-tree"] = { event = "BufWipeout" },
      },
      -- you can tweak any of the other opts from the docs above
    },
  },
}
