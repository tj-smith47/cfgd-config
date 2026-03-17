return {
  { -- Refactoring Plugin
    "ThePrimeagen/refactoring.nvim",
    cmd = "Refactor",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      show_success_message = true,
    },
  },
}
