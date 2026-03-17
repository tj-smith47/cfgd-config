return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      max_width = { 120, 0.6 }, -- Greater of 180 columns and 90% of total
      min_width = { 60, 0.4 }, -- Greater of 60 columns and 40% of total
      prefer_width = 0.5, -- 70%
      win_options = {
        sidescrolloff = 15,
      },
    },
  },
}
