return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      diagnostics = "nvim_lsp",
      name_formatter = function(buf)
        if buf.name == "NvimTree_1" then
          return vim.split(vim.fn.getcwd(), "/")[#vim.split(vim.fn.getcwd(), "/")]
        end
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
        {
          filetype = "alpha",
          text = "Dashboard",
          text_align = "center",
          separator = true,
        },
      },
      separator_style = "slant",
      themable = true,
    },
  },
}
