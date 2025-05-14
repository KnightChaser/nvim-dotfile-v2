-- lua/plugins/git-blame.lua
return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    message_template = " <author> • <date> • <summary>",
    date_format = "%r",
    virtual_text_column = 1,
  },
}
