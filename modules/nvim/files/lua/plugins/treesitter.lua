return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-refactor",
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "mfussenegger/nvim-dap",
          "mfussenegger/nvim-dap-python",
          "theHamsta/nvim-dap-virtual-text",
          "nvim-neotest/nvim-nio",
        },
      },
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      autotag = {
        enabled = true,
      },
      autopairs = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "elixir",
        "dockerfile",
        "go",
        "lua",
        "javascript",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "ruby",
        "sql",
        "tsx",
        "typescript",
        -- 'help',
        "vim",
        "yaml",
      },
      ignore_install = { "gdscript" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "typescript", "tsx" },
      },
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = false,
          node_incremental = false,
          scope_incremental = false,
          node_decremental = false,
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        lsp_interop = {
          enable = true,
          border = "rounded",
          peek_definition_code = {
            ["<leader>pd"] = "@function.outer",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
      },
      sync_install = true,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      require("dap-python").setup(vim.fn.exepath("python3"))
      -- require("nvim-dap-virtual-text").setup()
      require("dapui").setup()
    end,
  },
  "norcalli/nvim-colorizer.lua",
  -- Procfile treesitter support
  "technicalpickles/procfile.vim",
}
