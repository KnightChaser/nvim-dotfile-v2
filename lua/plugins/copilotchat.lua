return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim", -- core Copilot engine
      "nvim-lua/plenary.nvim", -- async, curl, logging
      "nvim-telescope/telescope-ui-select.nvim", -- slick picker
    },
    build = "make tiktoken", -- only if you installed tiktoken
    opts = {
      agent = "copilot",
      system_prompt = "COPILOT_INSTRUCTIONS",
      temperature = 0.2, -- a touch of randomness
      completeopt = { "menu", "menuone", "noselect", "popup" },

      window = {
        layout = "float",
        width = 0.6,
        height = 0.6,
        border = "rounded",
        title = "🤖 Copilot Chat",
      },

      mappings = {
        -- Use tab for completion
        complete = {
          detail = "Use @<Tab> or /<Tab> for options.",
          insert = "<Tab>",
        },
        -- Close the chat
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        -- Reset the chat buffer
        reset = {
          normal = "<C-x>",
          insert = "<C-x>",
        },
        -- Submit the prompt to Copilot
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-CR>",
        },
        -- Accept the diff
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
          action = function(chat)
            chat.apply_diff()
            chat.close()
          end,
        },
        -- Show help
        show_help = {
          normal = "g?",
        },
      },

      sticky = {
        "#buffer",
      },

      prompts = {
        Explain = { prompt = "Explain this code succinctly." },
        Fix = { prompt = "Identify bugs and rewrite with fixes." },
      },
    },
  },
}
