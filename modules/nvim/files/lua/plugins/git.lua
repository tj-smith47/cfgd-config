return {
  -- Git related plugins
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiff", "Gblame", "Gread", "Gwrite" },
  },
  {
    "tpope/vim-rhubarb",
    cmd = { "GBrowse" },
  },
  "nvim-lua/plenary.nvim",
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = {
      "tpope/vim-fugitive",
      "folke/trouble.nvim",
    },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  {
    "kessejones/git-blame-line.nvim",
    cmd = { "GitBlameLineToggle", "GitBlameLineEnable", "GitBlameLineDisable" },
    opts = {
      git = {
        default_message = "Not committed yet",
        blame_format = "%an - %ar - %s", -- see https://git-scm.com/docs/pretty-formats
      },
      view = {
        left_padding_size = 5,
        enable_cursor_hold = false,
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
