-- lua/config/keymaps.lua
local km = vim.keymap

-- jump up into the TS context window
km.set("n", "jc", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to TS context" })
