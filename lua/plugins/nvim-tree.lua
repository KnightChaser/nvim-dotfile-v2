-- lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive" },
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = true },

      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- load all the defaults
        api.config.mappings.default_on_attach(bufnr)

        -- OVERRIDE <CR> to open in the last-used window (no window picker)
        vim.keymap.set("n", "<CR>", api.node.open.no_window_picker, opts("Open"))

        -- other custom mappings
        vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      end,
    })

    -- global toggles
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
    vim.keymap.set(
      "n",
      "<leader>f",
      ":NvimTreeFindFile<CR>",
      { noremap = true, silent = true, desc = "Find File in NvimTree" }
    )
  end,
}
