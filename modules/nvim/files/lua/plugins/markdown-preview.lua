return {
  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
  },
  { -- View Markdown Live in the Browser
    "iamcco/markdown-preview.nvim",
    build = function()
      local ui = vim.api.nvim_list_uis()
      if ui and #ui > 0 then
        vim.fn["mkdp#util#install"]()
      end
    end,
    ft = "markdown",
    config = function()
      -- Markdown Preview settings
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_port = "57843"
    end,
  },
}
