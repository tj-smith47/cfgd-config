local cmdline_opts = {
  border = {
    style = "rounded",
  },
  size = {
    min_width = 60,
  },
}
return {
  {
    "rcarriga/nvim-notify",
    event = "UIEnter",
    opts = {
      timeout = 5000,
      top_down = true,
      stages = "slide",
      fps = 60,
      background_colour = "#11111b",
      max_height = function()
        return math.floor(vim.o.lines * 0.50)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.50)
      end,
    },
  },
  -- {
  --   "mrded/nvim-lsp-notify",
  --   dependencies = { "rcarriga/nvim-notify" },
  --   -- NOTE: calling `opts = {}` automatically calls the `setup()` fn
  --   opts = {},
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = "_", opts = cmdline_opts },
          search_down = {
            view = "cmdline",
            kind = "Search",
            pattern = "^/",
            icon = "🔎 ",
            ft = "regex",
            opts = cmdline_opts,
          },
          search_up = {
            view = "cmdline",
            kind = "Search",
            pattern = "^%?",
            icon = "🔎 ",
            ft = "regex",
            opts = cmdline_opts,
          },
          input = { icon = "✏️ ", ft = "text", opts = cmdline_opts },
          calculator = { pattern = "^=", icon = "", lang = "vimnormal", opts = cmdline_opts },
          substitute = {
            pattern = "^:%%?s/",
            icon = "🔁",
            ft = "regex",
            opts = { border = { text = { top = " sub (old/new/) " } } },
          },
          filter = { pattern = "^:%s*!", icon = "$", ft = "sh", opts = cmdline_opts },
          filefilter = { kind = "Filter", pattern = "^:%s*%%%s*!", icon = "📄 $", ft = "sh", opts = cmdline_opts },
          selectionfilter = {
            kind = "Filter",
            pattern = "^:%s*%'<,%'>%s*!",
            icon = " $",
            ft = "sh",
            opts = cmdline_opts,
          },
          lua = { pattern = "^:%s*lua%s+", icon = "(lua)", ft = "lua", opts = cmdline_opts },
          rename = {
            pattern = "^:%s*IncRename%s+",
            icon = "✏️ ",
            conceal = true,
            opts = {
              relative = "cursor",
              size = { min_width = 20 },
              position = { row = -3, col = 0 },
              buf_options = { filetype = "text" },
              border = { text = { top = " rename " } },
            },
          },
          help = { pattern = "^:%s*h%s+", icon = "💡", opts = cmdline_opts },
        },
      },
      lsp = {
        progress = {
          enabled = false,
          view = "notify",
        },
        override = {
          -- override the default lsp markdown formatter with Noice
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          -- override the lsp markdown formatter with Noice
          ["vim.lsp.util.stylize_markdown"] = false,
          -- override cmp documentation with Noice (needs the other options to work)
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = true,
          border = {
            style = "rounded",
            background_colour = "#11111b",
          },
          -- view = "mini",
        },
        message = {
          enabled = true,
          view = "notify",
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = false,
          },
          view = "notify",
        },
      },
      messages = {
        enabled = true,
      },
      popupmenu = {
        enabled = true,
        backend = "cmp",
      },
      presets = {
        command_palette = true,
        lsp_doc_border = true,
      },
      views = {
        cmdline_popup = {
          position = {
            row = "47%",
            col = "50%",
          },
          size = {
            width = 100,
            min_width = 60,
            height = "auto",
          },
        },
        cmdline_popupmenu = {
          relative = "editor",
          position = {
            row = "55%",
            col = "50%",
          },
          size = {
            width = 100,
            min_width = 60,
            height = "auto",
            max_height = math.floor(vim.o.lines * 0.3),
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          scrollbar = true,
          win_options = {
            winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "DiagnosticError" }, -- RED border
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = "60%",
            col = "50%",
          },
          size = {
            width = 100,
            height = "auto",
            max_height = 15,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          scrollbar = true,
          win_options = {
            winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "DiagnosticHint" }, -- CYAN border
          },
        },
        -- hover = {
        --   border = {
        --     style = "single",
        --   },
        -- },
        confirm = {
          border = {
            style = "single",
          },
        },
        popup = {
          position = {
            row = "60%",
            col = "50%",
          },
          border = {
            style = "single",
          },
        },
      },
      -- status = {
      --   lsp_progress = { event = "lsp", kind = "progress" },
      -- },
      routes = {
        -- { filter = { find = "E162" }, view = "mini" },
        { filter = { event = "msg_show", kind = "", find = "written" }, view = "notify" },
        { filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
        { filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
        { filter = { event = "emsg", find = "E23" }, skip = true },
        -- { filter = { event = "emsg", find = "E20" }, skip = true },
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          skip = true,
        },
        {
          filter = {
            event = "notify",
            find = "No matching notification found to replace",
          },
          skip = true,
        },
        { filter = { find = "No signature help" }, skip = true },
        { filter = { event = "emsg", find = "" }, skip = true },
      },
    },
    config = function(_, opts)
      -- require("notify").setup()
      require("noice").setup(opts)
      vim.api.nvim_set_hl(0, "NoicePopupBorder", { fg = "#FFFFFF" })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#bd93f9" })
      vim.api.nvim_set_hl(0, "NoiceCmdline", { fg = "#ff79c6" })
    end,
  },
  -- {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require("fidget").setup({
  --       integration = {
  --         ["nvim-tree"] = {
  --           enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
  --         },
  --       },
  --       notification = {
  --         override_vim_notify = true,
  --         -- Conditionally redirect notifications to another backend
  --         redirect = function(msg, level, opts)
  --           if opts and opts.on_open then
  --             return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
  --           end
  --         end,
  --         window = {
  --           align = "bottom",
  --           border = "rounded",
  --           winblend = 50,
  --           x_padding = 4,
  --           y_padding = 2,
  --         },
  --       },
  --     })
  --   end,
  -- },
}
