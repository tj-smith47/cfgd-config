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
      -- The hijack still retargets an already-open tree at a directory opened
      -- mid-session, but it must not open the tree itself: during startup it
      -- runs from a BufEnter raised while plugins are still loading, before the
      -- argument buffer is loaded, and the tree it draws there comes up empty.
      -- config/autocmds.lua opens the tree on VimEnter instead.
      hijack_directories = { auto_open = false },
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
        width = 30,
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
