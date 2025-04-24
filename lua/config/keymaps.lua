-- lua/config/keymaps.lua
local km = vim.keymap

-- After everything loads,
-- nukes "jc” keymap so "j"(down) keymap works immediately.
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    km.del("n", "jc")
  end,
})

-- jump up into the TS context window
km.set("n", "jc", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to TS context" })

-- barbar.nvim
local map = vim.keymap.set
local opts = { silent = true, noremap = true }
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
for i = 1, 9 do
  map("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", opts)
end
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map("n", "<leader>xbc", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>xbac", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
