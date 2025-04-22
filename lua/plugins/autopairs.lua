-- lua/plugins/autopairs.lua
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- opts will be passed to require("nvim-autopairs").setup(opts)
    opts = {
      -- disable in these filetypes
      disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input" },
      check_ts = true, -- use treesitter to help decide when to autopair
      fast_wrap = { -- <M-e> to trigger “fast wrap”
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        before_key = "h",
        after_key = "l",
        cursor_pos = true,
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        highlight = "Search",
        highlight_grey = "Comment",
      },
      -- leave map_cr=true so <CR> auto-indents nicely
      map_cr = true,
      map_bs = true,
      enable_moveright = true,
      enable_afterquote = true,
    },
  },
}
