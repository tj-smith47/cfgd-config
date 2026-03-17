return {
  -- Theme
  {
    "maxmx03/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      ---@type dracula
      local dracula = require("dracula")

      dracula.setup({
        styles = {
          types = {},
          functions = {},
          parameters = {},
          comments = {},
          strings = {},
          keywords = {},
          variables = {},
          constants = {},
        },
        transparent = true,
        -- on_colors = function(colors, color)
        --   ---@type dracula.palette
        --   return {
        --     -- override or create new colors
        --     mycolor = "#ffffff",
        --   }
        -- end,
        -- on_highlights = function(colors, color)
        --   ---@type dracula.highlights
        --   return {
        --     ---@type vim.api.keyset.highlight
        --     Normal = { fg = colors.mycolor },
        --   }
        -- end,
        plugins = {
          ["nvim-treesitter"] = true,
          ["rainbow-delimiters"] = true,
          ["nvim-lspconfig"] = true,
          ["nvim-navic"] = true,
          ["nvim-cmp"] = true,
          ["indent-blankline.nvim"] = true,
          ["neo-tree.nvim"] = true,
          ["nvim-tree.lua"] = true,
          ["which-key.nvim"] = true,
          ["dashboard-nvim"] = true,
          ["gitsigns.nvim"] = true,
          ["neogit"] = true,
          ["todo-comments.nvim"] = true,
          ["lazy.nvim"] = true,
          ["telescope.nvim"] = true,
          ["noice.nvim"] = true,
          ["hop.nvim"] = true,
          ["mini.statusline"] = true,
          ["mini.tabline"] = true,
          ["mini.starter"] = true,
          ["mini.cursorword"] = true,
          ["bufferline.nvim"] = true,
        },
      })
      -- vim.cmd.colorscheme("dracula-soft")
      vim.cmd.colorscheme("dracula")
    end,
  },
  -- { -- Dracula
  --   "Mofiqul/dracula.nvim",
  --   lazy = false,
  --   priority = 1025,
  --   event = { "VimEnter", "BufAdd", "BufNew", "BufNewFile", "FocusGained" },
  --   config = function()
  --     require("dracula").setup()
  --     vim.cmd.colorscheme("dracula")
  --   end,
  -- },
}
