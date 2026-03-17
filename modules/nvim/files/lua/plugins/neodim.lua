return {
  { -- Dim Unused Objects
    "zbirenbaum/neodim",
    event = "LspAttach",
    opts = {
      alpha = 0.75,
      blend_color = "#000000",
      -- disable = {}, -- table of filetypes to disable neodim
      hide = { underline = true, virtual_text = false, signs = true },
      refresh_delay = 50, -- time in ms to wait after typing before refresh diagnostics
    },
  },
}
