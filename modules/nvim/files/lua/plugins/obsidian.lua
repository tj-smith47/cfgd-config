return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Salesloft",
        path = "~/.config/obsidian/salesloft",
      },
    },
    completion = {
      nvim_cmp = true,
    },
  },
}
