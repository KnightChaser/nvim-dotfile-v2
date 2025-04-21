-- ~/.config/nvim/init.lua
vim.g.mapleader = " "

-- bootstrap lazy.nvim here (as before)…
require("config.lazy") -- <— this loads all plugins
require("config.options")
require("config.keymaps")
