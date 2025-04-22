return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp", -- optional, for jsregexp support
    dependencies = {
      "rafamadriz/friendly-snippets", -- a collection of snippets
    },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    },
    config = function(_, opts)
      local luasnip = require("luasnip")
      -- Apply options
      luasnip.config.set_config(opts)
      -- Load VSCode-style snippets from installed plugins
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Keymaps for expanding and jumping
      local map = vim.keymap.set
      -- Expand or jump forward
      map({ "i", "s" }, "<C-K>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { silent = true })
      -- Jump backward
      map({ "i", "s" }, "<C-J>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })
      -- Change choice in choiceNode
      map({ "i", "s" }, "<C-L>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true })
    end,
  },
}
