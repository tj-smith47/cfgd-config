return {
  -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "folke/noice.nvim",
    { -- Fuzzy Finder Algorithm
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1,
    },
    { -- Project Viewer
      "ahmedkhalf/project.nvim",
      event = "VeryLazy",
      main = "project_nvim",
      opts = {},
    },
    {
      "isak102/telescope-git-file-history.nvim",
      dependencies = { "tpope/vim-fugitive" },
    },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "someone-stole-my-name/yaml-companion.nvim",
    "jonarrien/telescope-cmdline.nvim",
    "jvgrootveld/telescope-zoxide",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "nvim-lua/plenary.nvim",
  },
  -- keys = {
  --   { ":", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
  -- },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod
    local z_utils = require("telescope._extensions.zoxide.utils")

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.sources.telescope")

    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.open,
          },
        },
        path_display = { "smart" },
      },
      extensions = {
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
          mappings = {
            default = {
              after_action = function(selection)
                print("Update to (" .. selection.z_score .. ") " .. selection.path)
              end,
            },
            ["<C-s>"] = {
              before_action = function(selection)
                print("before C-s")
              end,
              action = function(selection)
                vim.cmd.edit(selection.path)
              end,
            },
            -- Opens the selected entry in a new split
            ["<C-q>"] = { action = z_utils.create_basic_command("split") },
          },
        },
        -- cmdline = {
        --   picker = {
        --     layout_config = {
        --       width = 120,
        --       height = 25,
        --     },
        --   },
        --   mappings = {
        --     complete = "<Tab>",
        --     run_selection = "<C-CR>",
        --     run_input = "<CR>",
        --   },
        -- },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("cmdline")
    telescope.load_extension("fzf")
    telescope.load_extension("git_file_history")
    telescope.load_extension("noice")
    telescope.load_extension("notify")
    telescope.load_extension("projects")
    telescope.load_extension("ui-select")
    telescope.load_extension("yaml_schema")
    telescope.load_extension("zoxide")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find projects" })
    keymap.set("n", "<leader>fz", "<cmd>Telescope zoxide list<cr>", { desc = "Find zoxide" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
