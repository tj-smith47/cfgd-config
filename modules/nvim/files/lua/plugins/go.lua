return {
  { -- Go plugins
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "CmdlineEnter",
    ft = { "go", "gomod" },
    opts = {
      dap_debug = true,
      diagnostic = {
        update_in_insert = false,
        virtual_text = false,
      },
      goimports = "goimports",
      gofmt = "gofumpt",
      lsp_inlay_hints = {
        enable = false,
      },
    },
  },
  { -- Hugo
    "phelipetls/vim-hugo",
  },
}
