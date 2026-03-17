local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Automatically update changed file in Vim
-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = augroup("refresh_file"),
  command = [[silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif]],
})

-- [[ Format on save: Terraform, TypeScript, Lua ]]
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*.tf", "*.tfvars", "*.ts", "*.tsx", "*.lua" },
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

-- [[ Disable format-on-save for *.cm files ]]
vim.api.nvim_create_autocmd({ "BufReadPre", "BufWritePre" }, {
  group = augroup("disable_format_on_save"),
  command = "setlocal formatprg=",
  pattern = { "*.cm", "**/*.cm", "*.ts", "*.lua" },
})

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.hl.on_yank()
  end,
  pattern = "*",
})

-- [[ Open nvim-tree when opening a directory ]]
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function(data)
    if vim.fn.isdirectory(data.file) == 1 then
      vim.cmd("enew")
      vim.cmd.bw(data.buf)
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.toggle()
      -- Move focus back to the file
      vim.cmd.wincmd("p")
    end
  end,
})
