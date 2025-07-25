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
map("n", "<leader>,", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>.", "<Cmd>BufferNext<CR>", opts)
map("n", "<leader><", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<leader>>", "<Cmd>BufferMoveNext<CR>", opts)
for i = 1, 9 do
  -- This will map <space>1, <space>2, etc. to switch buffers
  map("n", "<leader>" .. i, "<Cmd>BufferGoto " .. i .. "<CR>", opts)
end
map("n", "<leader>0", "<Cmd>BufferLast<CR>", opts)
map("n", "<leader>p", "<Cmd>BufferPin<CR>", opts)
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map("n", "<leader>xbc", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>xbac", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
