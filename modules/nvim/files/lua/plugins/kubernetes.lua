return {
  {
    "diogo464/kubernetes.nvim",
    ft = { "yaml", "yml" },
    opts = {
      -- this can help with autocomplete. it sets the `additionalProperties` field on type definitions to false if it is not already present.
      schema_strict = true,
      -- true:  generate the schema every time the plugin starts
      -- false: only generate the schema if the files don't already exists. run `:KubernetesGenerateSchema` manually to generate the schema if needed.
      schema_generate_always = true,
      -- Patch yaml-language-server's validation.js file.
      patch = true,
      -- root path of the yamlls language server. by default it is assumed you are using mason but if not this option allows changing that path.
      yamlls_root = function()
        return vim.fs.joinpath(vim.fn.stdpath("data"), "/mason/packages/yaml-language-server/")
      end,
    },
    config = function(opts)
      require("kubernetes").setup(opts)
    end,
  },
  -- {
  --   "anasinnyk/nvim-k8s-crd",
  --   event = { "BufReadPre", "BufNewFile" }, -- or { 'BufEnter *.yaml' },
  --   dependencies = { "neovim/nvim-lspconfig" },
  --   opts = {
  --     cache_dir = "/root/.cache/k8s-schemas/",
  --     k8s = {
  --       file_mask = "*.yaml",
  --     },
  --   },
  --   config = function(opts)
  --     require("nvim-k8s-crd").setup(opts)
  --   end,
  -- },
}
