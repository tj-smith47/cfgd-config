return {
  { -- Fancier statusline
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "maxmx03/dracula.nvim" },
    opts = {
      options = {
        component_separators = "|",
        icons_enabled = true,
        refresh = {
          statusline = 1000,
        },
        theme = vim.g.colors_name,
        -- theme = "dracula-nvim",
        section_separators = "",
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
      },
    },
  },
}
