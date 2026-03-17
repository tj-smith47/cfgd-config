return {
  -- Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
  { -- Chat Plugin
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatToggle" },
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true,
    },
  },

  -- Other AI Plugins
  {
    "robitx/gp.nvim",
    tag = "v3.5.1",
    cmd = { "GpChatNew", "GpChatToggle", "GpRewrite", "GpAppend", "GpPrepend" },
    config = function()
      local conf = {
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        providers = {
          openai = {
            disable = false,
            endpoint = "https://api.openai.com/v1/chat/completions",
            secret = os.getenv("OPENAI_API_KEY"),
          },
        },
      }
      require("gp").setup(conf)
    end,
  },
}
