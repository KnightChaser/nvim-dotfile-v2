-- ~/.config/nvim/lua/plugins/lualine.lua
local session_start = os.time()

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        -- use a sharp “>” instead of the default round-edged glyphs
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        -- ┌─ left side
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          -- filename only, no absolute path
          { "filename", path = 0 },
        },

        -- ── right side
        lualine_x = {
          {
            -- error/warn/info/hint counts
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { error = " ", warn = " ", info = "", hint = "󱧡 " },
            colored = true,
            always_visible = true,
          },
          {
            "copilot",
          },
        },
        lualine_y = {
          {
            -- filetype icon only
            "filetype",
            icon_only = false,
          },
          {
            -- current user
            function()
              return os.getenv("USER") or ""
            end,
          },
          "location", -- line:col
        },
        lualine_z = {
          {
            -- timestamp + session uptime
            function()
              local now = os.date("%m/%d %H:%M:%S")
              local elapsed = os.time() - session_start
              local h = math.floor(elapsed / 3600)
              local m = math.floor((elapsed % 3600) / 60)
              local s = elapsed % 60
              -- local up = string.format("%02d:%02d:%02d", h, m, s)
              if h > 0 then
                return string.format("%s ( %02dh %02dm %02ds)", now, h, m, s)
              elseif m > 0 then
                return string.format("%s ( %02dm %02ds)", now, m, s)
              elseif s >= 0 then
                return string.format("%s ( %02ds)", now, s)
              end

              return string.format("%s ( %s)", now, up)
            end,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 0 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "quickfix", "nvim-tree", "lazy", "toggleterm" },
      {
        "copilot",
        symbols = {
          status = {
            icons = {
              enabled = " ",
              disabled = " ",
              loading = " ",
              warning = " ",
              unknown = " ",
            },
            hl = {
              enabled = "#50FA7B",
              disabled = "#6272A4",
              loading = "#AEB7D0",
              warning = "#FFB86C",
              unknown = "#FF5555",
            },
          },
          spinners = "dots",
          spinner_color = "#6272A4",
        },
        show_colors = false,
        show_loading = true,
      },
    })
  end,
}
