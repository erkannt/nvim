return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  opts = {
    adapters = {
      http = {
        cerebras = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://api.cerebras.ai",
              api_key = "CEREBRAS_API_KEY",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                default = "gpt-oss-120b",
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = {
        adapter = "cerebras",
      },
      inline = {
        adapter = "cerebras",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
