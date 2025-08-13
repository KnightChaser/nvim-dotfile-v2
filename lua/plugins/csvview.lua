-- lua/plugins/csvview.lua
return {
  "hat0uma/csvview.nvim",
  ft = { "csv", "tsv" }, -- load on CSV-like files
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
    parser = { comments = { "#", "//" } },
    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
  config = function(_, opts)
    require("csvview").setup(opts)

    -- Auto-enable on CSV buffers only
    local grp = vim.api.nvim_create_augroup("CsvViewAutoEnable", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = grp,
      pattern = { "csv", "tsv" }, -- add more like "csv_semicolon" if you use them
      callback = function()
        vim.cmd([[silent! CsvViewEnable display_mode=border]])
      end,
    })
  end,
}
