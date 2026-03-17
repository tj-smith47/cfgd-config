return {
  { -- Visual Indentation Lines
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",
    opts = {
      indent = {
        char = "┊",
        smart_indent_cap = true,
        highlight = {
          "Conditional",
          "Function",
          "Label",
        },
      },
      whitespace = {
        highlight = {
          "Whitespace",
          "NonText",
        },
      },
      scope = {
        enabled = true,
        char = "|",
        highlight = {
          "Conditional",
          "Function",
          "Label",
        },
        show_start = true,
        show_end = false,
      },
    },
  },
}
