-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et ai nosta
require("config.options")
require("config.lazy")
-- Loaded here rather than from VeryLazy: lazy.nvim raises VeryLazy after
-- VimEnter, so the VimEnter autocmds in this module would never be armed.
require("config.autocmds")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.keymaps")
  end,
})
