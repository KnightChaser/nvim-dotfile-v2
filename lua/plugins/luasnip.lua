-- lua/plugins/luasnip.lua
return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- follow latest v2.x release
    build = "make install_jsregexp", -- optional, for lsp-snippet-transformations
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      -- Basic configuration
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })
      -- Load vscode-style snippets from friendly-snippets and any other installed vscode snippet packs
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Keymaps for expanding/jumping in snippets
      vim.keymap.set({ "i" }, "<C-K>", function()
        luasnip.expand()
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        luasnip.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function()
        luasnip.jump(-1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end, { silent = true })
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = true, -- loaded on demand by LuaSnip
  },
}
