-- ~/.config/nvim/init.lua
vim.g.mapleader = " "

-- bootstrap lazy.nvim here (as before)…
require("config.lazy") -- <— this loads all plugins
require("config.options")
require("config.keymaps")

-- Save shutdown time
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local shutdown_time = os.time()
    local file = io.open(vim.fn.stdpath("data") .. "/last-shutdown-timestamp.txt", "w")
    if file then
      file:write(shutdown_time)
      file:close()
    end
  end,
})

-- C# configuration (omnisharp)
if vim.loop.os_uname().sysname == "Windows_NT" then
  local lspconfig = require("lspconfig")
  local pid = vim.fn.getpid()
  lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
  })
end
