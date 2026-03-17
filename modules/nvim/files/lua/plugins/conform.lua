return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      format = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
      },
      formatters_by_ft = {
        -- ["*"] = { "codespell" },
        ["*.sh"] = { "shfmt", "shellcheck", "shellharden" },
        css = { "stylelint", "prettier" },
        cm = {},
        elixir = { "mix" },
        go = { "goimports", "gofumpt" },
        html = { "htmlbeautifier" },
        -- javascript = { "biome" },
        -- javascriptreact = { "biome" },
        json = { "fixjson", "jq" },
        -- lua = { "stylua" },
        -- markdown = { "mdformat" },
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_organize_imports", "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
        ruby = { "rubocop" },
        sql = { "sqlfmt", "pg_format" },
        terraform = { "terraform_fmt" },
        -- typescript = { "biome" },
        -- typescriptreact = { "biome" },
        -- yaml = { "yamlfmt" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        -- ["_"] = { "codespell" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
        quiet = true,
      },
      format_after_save = {
        lsp_format = "fallback",
      },
    },
  },
  -- {
  --   "cappyzawa/trim.nvim",
  --   event = { "BufReadPre", "BufWritePre" },
  --   config = function()
  --     require("trim").setup({
  --       python = false,
  --       patterns = {
  --         [[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
  --       },
  --     })
  --   end,
  -- },
}
