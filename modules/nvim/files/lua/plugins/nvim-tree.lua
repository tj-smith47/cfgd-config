return {
  { -- Icons
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").get_icons()
      require("nvim-web-devicons").setup({ color_icons = true })
    end,
  },
  { -- File Explorer
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        dependencies = {
          "neovim/nvim-lspconfig",
        },
        opts = {
          lsp = {
            auto_attach = true,
            preference = {
              "pyright",
            },
          },
        },
      },
    },
    opts = {
      disable_netrw = true,
      -- filters = {
      --   git_ignored = false,
      -- },
      renderer = {
        icons = {
          web_devicons = {
            file = {
              enable = true,
              color = true,
            },
            folder = {
              enable = true,
              color = true,
            },
          },
          glyphs = {
            git = {
              unstaged = "✘",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      view = {
        width = 40,
      },

      -- For project.nvim (Telescope)
      respect_buf_cwd = true,
      -- sync_root_with_cwd = true,
      update_focused_file = {
        -- enable = true,
        -- update_root = true,
      },
    },
  },
  { -- Winbar
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    opts = {},
  },
}
