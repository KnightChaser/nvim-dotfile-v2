-- lua/plugins/copilotchat.lua
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    build = "make tiktoken",
    opts = {
      agent = "copilot",
      system_prompt = "COPILOT_INSTRUCTIONS",
      temperature = 0.2,
      completeopt = { "menu", "menuone", "noselect", "popup" },

      window = {
        layout = "float",
        width = 0.6,
        height = 0.6,
        border = "rounded",
        title = "🤖 Copilot Chat",
        options = { winblend = 10 },
      },

      sticky = {
        "#buffer",
        "#filetree",
        "#git",
      },

      mappings = {
        complete = { detail = "Use @<Tab> or /<Tab> for options.", insert = "<Tab>" },
        close = { normal = "q", insert = "<C-c>" },
        reset = { normal = "<C-x>", insert = "<C-x>" },
        submit_prompt = { normal = "<CR>", insert = "<C-CR>" },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
          action = function(chat)
            chat.apply_diff()
            chat.close()
          end,
        },
        show_help = { normal = "g?" },
        add_context = { normal = "ga" },
        remove_context = { normal = "gr" },
        refactor = {
          normal = "<leader>cr",
          action = function(chat)
            chat.ask("Refactor this code into cleaner, idiomatic Lua.")
          end,
        },
      },

      prompts = {
        Explain = { prompt = "Explain this code succinctly." },
        Fix = { prompt = "Identify bugs and rewrite with fixes." },
        Optimize = { prompt = "Suggest performance or readability improvements." },
        Test = { prompt = "Write unit tests for this code (use the local test framework if clear)." },
        Docs = { prompt = "Generate concise documentation comments for this function." },
        Commit = { prompt = "Suggest a clean, conventional commit message for the staged changes." },
      },

      completion = {
        enabled = true,
        debounce_ms = 150,
        min_chars = 2,
      },
    },
  },
}
