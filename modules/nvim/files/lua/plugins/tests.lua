return {
  { -- Test Coverage
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("coverage").setup()
    end,
  },

  --  { -- Test Runner
  --    "nvim-neotest/neotest",
  --    dependencies = {
  --      "nvim-lua/plenary.nvim",
  --      "antoinemadec/FixCursorHold.nvim",
  --      "nvim-treesitter/nvim-treesitter",
  --      "nvim-neotest/neotest-python",
  --      "olimorris/neotest-rspec",
  --      "jfpedroza/neotest-elixir",
  --      "thenbe/neotest-playwright",
  --      "nvim-neotest/neotest-jest",
  --      "nvim-neotest/nvim-nio",
  --    },
  --    config = function()
  --      -- get neotest namespace (api call creates or returns namespace)
  --      local neotest_ns = vim.api.nvim_create_namespace("neotest")
  --      vim.diagnostic.config({
  --        virtual_text = {
  --          format = function(diagnostic)
  --            local message =
  --                diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
  --            return message
  --          end,
  --        },
  --      }, neotest_ns)
  --      require("neotest").setup({
  --        adapters = {
  --          require("neotest-elixir"),
  --          require("neotest-jest"),
  --          require("neotest-playwright").adapter({
  --            options = {
  --              persist_project_selection = true,
  --              enable_dynamic_test_discovery = true,
  --            }
  --          }),
  --          require("neotest-python")({
  --            runner = "pytest",
  --            pytest_discover_instances = true,
  --          }),
  --          require("neotest-rspec")({
  --            rspec_cmd = function()
  --              return vim.tbl_flatten({
  --                "RAILS_ENV=test",
  --                "bundle",
  --                "exec",
  --                "rspec",
  --              })
  --            end
  --          }),
  --        }
  --      })
  --    end
  --  },
} --
