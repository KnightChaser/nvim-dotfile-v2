-- lua/plugins/mason-lspconfig.lua

-- This file was intentionally creted to fix bugs in Mason
-- reported at https://github.com/LazyVim/LazyVim/issues/6039.

-- soulution (https://github.com/LazyVim/LazyVim/issues/6039#issuecomment-2856502153)
return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
