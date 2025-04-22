-- lua/plugins/fidget.lua
return {
  "j-hui/fidget.nvim",
  event = "LspAttach", -- load as soon as any LSP attaches
  opts = {
    progress = {
      -- don’t show new fidgets while in insert mode
      suppress_on_insert = true,
      -- drop messages that have no user‑visible text
      ignore_empty_message = true,
      display = {
        -- check mark when a task finishes
        done_icon = "✔",
        -- use the built‑in “dots” spinner
        progress_icon = { "dots" },
      },
      -- you can tune polling here (default is 0, i.e. immediate)
      poll_rate = 500,
    },
    -- you can add `notification`, `integration`, `logger` here if you need them
  },
  config = function(_, opts)
    require("fidget").setup(opts)
  end,
}
